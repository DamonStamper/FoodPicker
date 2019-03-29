import unittest
import requests
from selenium import webdriver
from selenium.webdriver.common.keys import Keys

class healthzTest(unittest.TestCase):

    def setUp(self):
        self.driver = webdriver.Firefox()

    def test_search_in_python_org(self):
        driver = self.driver
        response = requests.get("localhost:80/healthz")
        self.assertEqual(200, response.status_code)


    def tearDown(self):
        self.driver.close()

if __name__ == "__main__":
    unittest.main()