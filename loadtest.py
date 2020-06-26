""" Molotov-based test.
"""
import json
from molotov import scenario, setup, global_setup, teardown, global_teardown


# This is the service you want to load test
_API = "http://104.199.125.107"


@global_setup()
def test_starts(args):
    """ This functions is called before anything starts.

    Notice that it's not a coroutine.
    """
    pass


@setup()
async def worker_starts(worker_id, args):
    """ This function is called once per worker.

    If it returns a mapping, it will be used with all requests.

    You can add things like Authorization headers for instance,
    by setting a "headers" key.
    """
    headers = {"SomeHeader": "1"}
    return {"headers": headers}


@teardown()
def worker_ends(worker_id):
    """ This functions is called when the worker is done.

    Notice that it's not a coroutine.
    """
    pass


@global_teardown()
def test_ends():
    """ This functions is called when everything is done.

    Notice that it's not a coroutine.
    """
    pass


# all scenarii are coroutines
@scenario(weight=30)
async def scenario_two(session):
    # a call to one of the session method should be awaited
    # see aiohttp.Client docs for more info on this
    async with session.get(_API) as resp:
        assert resp.status == 200
