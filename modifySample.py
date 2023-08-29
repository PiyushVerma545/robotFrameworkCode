class ResultModifier:
    ROBOT_LISTENER_API_VERSION = 3

    def __init__(self, max_seconds=10):
        self.max_milliseconds = float(max_seconds) * 1000

    def start_suite(self, data, suite):
        suite.doc = 'Documentation set by listener.'
        # Information about tests only available via data at this point.
        smoke_tests = [test for test in data.tests if 'smoke' in test.tags]
        suite.metadata['Smoke tests'] = len(smoke_tests)

    def end_test(self, data, test):
        if test.status == 'PASS' and test.elapsedtime > self.max_milliseconds:
            test.status = 'FAIL'
            test.message = 'Test execution took too long.'

    def log_message(self, msg):
        if msg.level == 'WARN' and not msg.html:
            msg.message = '<b style="font-size: 1.5em">%s</b>' % msg.message
            msg.html = True