function [nodeList, result] = dls(source, target, startNode, targetNode, depth)

nodeList = startNode;
result = 0;

if startNode == targetNode
    result = 1;
    return
elseif depth == 0
    return
end
children = getChildren(source, target, startNode);
for i = 1:numel(children)
    [nl, r] = dls(source, target, children(i), targetNode, depth-1);
    nodeList = [nodeList nl];
    if r == 1
        result = 1;
        return
    end
end

end
function children = getChildren(source, target, node)
    children = target(source == node);
end