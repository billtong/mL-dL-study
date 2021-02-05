%%
% test
% source = [1, 1, 1, 1, 2, 2, 2, 2, 2, 3, 3, 3, 3, 5, 15, 15, 15];
% target = [3, 5, 4, 2, 6, 10, 7, 9, 8, 14, 11, 12, 13, 15, 17, 16, 18];
% nodeList = bfs(source, target, 1, 15)
%%
function nodeList = bfs(source, target, startNode, targetNode)

nodeList = [];
visited = [];
queue = [];

visited(end+1) = startNode;
queue(end+1) = startNode;
iterations = 0;

while ~isempty(queue)
    currentNode = queue(1);
    queue(1) = [];
    iterations = iterations + 1;
    nodeList(end + 1) = currentNode;
    if currentNode == targetNode
        return
    end
    visited(end + 1) = currentNode;
    children = getChildren(source, target, currentNode);
    for i = 1:numel(children)
        if ~any(visited == children(i))
            queue(end+1) = children(i);
        end
    end
end
nodeList = -1;
disp('Target Not found!')
end
function children = getChildren(source, target, node)
    children = target(source == node);
end