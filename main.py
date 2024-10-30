from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager

chromedriver_path = "/opt/chromedriver-linux64/chromedriver"

options = Options()
options.add_argument('--headless')
options.add_argument('--no-sandbox')
options.add_argument('--disable-dev-shm-usage')

service = Service(executable_path=chromedriver_path)
driver = webdriver.Chrome(service=service, options=options)

driver.get("https://python.org")
print(driver.title)
driver.close()

