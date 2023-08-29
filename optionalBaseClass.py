from pathlib import Path
from robot.api import TestSuite
from robot.api.interfaces import Parser, TestDefaults


class ExampleParser(Parser):
    extension = ('example', 'another')

    def parse(self, source: Path, defaults: TestDefaults) -> TestSuite:
        """Create a suite and set possible defaults from init files to tests."""
        suite = TestSuite(TestSuite.name_from_source(source), source=source)
        for line in source.read_text().splitlines():
            test = suite.tests.create(name=line, doc='Example')
            test.body.create_keyword(name='Log', args=['Hello!'])
            defaults.set_to(test)
        return suite

    def parse_init(self, source: Path, defaults: TestDefaults) -> TestSuite:
        """Create a dummy suite and set some defaults.

        This method is called only if there is an initialization file with
        a supported extension.
        """
        defaults.tags = ('tags', 'from init')
        defaults.setup = {'name': 'Log', 'args': ['Hello from init!']}
        return TestSuite(TestSuite.name_from_source(source.parent), doc='Example',
                         source=source, metadata={'Example': 'Value'})