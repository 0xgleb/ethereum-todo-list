const TodoList = artifacts.require("./TodoList.sol");

contract("TodoList", accounts => {
    before(async () => {
        this.todoList = await TodoList.deployed();
    });

    it('deploys successfully', async () => {
        const address = await this.todoList.address;
        assert.notEqual(address, 0x0);
        assert.notEqual(address, '');
        assert.notEqual(address, null);
        assert.notEqual(address, undefined);
    });

    it('gets the right task by task id', async () => {
        const taskCount = await this.todoList.taskCount();

        const task = await this.todoList.tasks(taskCount);

        assert.equal(task.id.toNumber(), taskCount.toNumber());
    });

    it('can get the first task', async () => {
        const task = await this.todoList.tasks(1);

        assert.equal(task.id.toNumber(), 1);
        assert.equal(task.content, 'Write your first Ethereum smart contract');
        assert.equal(task.completed, false);
    });
});
