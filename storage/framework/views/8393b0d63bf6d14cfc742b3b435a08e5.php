
<?php $__env->startSection('content'); ?>
<h1>Posts</h1>
<a href="<?php echo e(route('posts.create')); ?>">Add New Post</a>
<table class="table table-striped">
    <tr>
        <th>Title</th>
        <th>Content</th>
        <th>Actions</th>
    </tr>
    <?php $__currentLoopData = $posts; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $post): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
    <tr>
        <td><?php echo e($post->title); ?></td>
        <td><?php echo e($post->content); ?></td>
        <td>
            <a href="<?php echo e(route('posts.edit', $post->id)); ?>" class="btn btn-primary">Edit</a>
            <form method="POST" action="<?php echo e(route('posts.destroy', $post->id)); ?>" style="display:inline;">
                <?php echo csrf_field(); ?>
                <?php echo method_field('DELETE'); ?>
                <button type="submit" class="btn btn-danger">Delete</button>
            </form>
        </td>
    </tr>
    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
</table>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\Users\Lenovo\blog\resources\views/posts/index.blade.php ENDPATH**/ ?>