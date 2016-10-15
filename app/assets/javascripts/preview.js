$(document).on("change","#prototype_capturedimages_attributes_0_image",function(){
    var file = this.files;

    if(!file[0].type.match(/^image\/(png|jpeg|gif)$/)) return;

    var img = new Image();
    var render = new FileReader();

    render.onload = function(e){

        var dataUri = this.result;

        $("#main_preview").attr('src',e.target.result);
    //     $('.cover-image-upload').css('background','white');
     }
    render.readAsDataURL(file[0]);
})


$(document).on("change","#prototype_capturedimages_attributes_1_image",function(){
    var file = this.files;

    if(!file[0].type.match(/^image\/(png|jpeg|gif)$/)) return;

    var img = new Image();
    var render = new FileReader();

    render.onload = function(e){

        var dataUri = this.result;

        $("#sub_1_preview").attr('src',e.target.result);
        // $("#sub_preview").css('width','100%')
    //     $('.cover-image-upload').css('background','white');
     }
    render.readAsDataURL(file[0]);
})

$(document).on("change","#prototype_capturedimages_attributes_2_image",function(){
    var file = this.files;

    if(!file[0].type.match(/^image\/(png|jpeg|gif)$/)) return;

    var img = new Image();
    var render = new FileReader();

    render.onload = function(e){

        var dataUri = this.result;

        $("#sub_2_preview").attr('src',e.target.result);
        // $("#sub_2_preview").css('width','100%')
    //     $('.cover-image-upload').css('background','white');
     }
    render.readAsDataURL(file[0]);
})


$(document).on("change","#prototype_capturedimages_attributes_3_image",function(){
    var file = this.files;

    if(!file[0].type.match(/^image\/(png|jpeg|gif)$/)) return;

    var img = new Image();
    var render = new FileReader();

    render.onload = function(e){

        var dataUri = this.result;

        $("#sub_3_preview").attr('src',e.target.result);
        // $("#sub_preview").css('width','100%')
    //     $('.cover-image-upload').css('background','white');
     }
    render.readAsDataURL(file[0]);
})

$(document).on("change","#user_avatar",function(){
    var file = this.files;

    if(!file[0].type.match(/^image\/(png|jpeg|gif)$/)) return;

    var img = new Image();
    var render = new FileReader();

    render.onload = function(e){

        if ($('src').length >0){
            $('src').remove();
        }
        $("#js-avatar").attr('src',e.target.result);
        $("#js-avatar").css('display','')
    //     $('.cover-image-upload').css('background','white');
     }
    render.readAsDataURL(file[0]);
})

