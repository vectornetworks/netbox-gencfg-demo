from setuptools import setup, find_packages

setup(
    name="gencfg",
    version="1.0.0",
    python_requires=">=3.5",
    install_requires=["requests", "pynetbox==5.3.1", "jinja2"],
    author="Brett Gianpetro",
    author_email="brettg@vectornetworksllc.com",
    description="An example Arista EOS configuration generator using Netbox as a data source",
    packages=find_packages(),
    entry_points={
      'console_scripts': [
        'gen-cfg=gencfg:main',
      ],
    },
)