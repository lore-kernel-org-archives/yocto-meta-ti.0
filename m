Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56253C77B73
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 15:18:08 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web10.863.1683040678925787355
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 02 May 2023 08:17:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=XbN1n5Jt;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 1A0FE100010;
	Tue,  2 May 2023 15:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1683040676;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KQ5jDt2f8i86nCLId24x803WzgJ3Li6ifCuMFhFmouY=;
	b=XbN1n5JthbvEsudarWD42S6SetxDcd+TmW2Td06god+QTq95bYWOjhTZpmLQXm8XDRt4mG
	Jabh2LUOJUww0I2/kzL9FTmcSx47JpZRkWnZrVK59rW8UVVlue+ievZBNwh/ivK0WgCDyq
	8eiwk9HaFZcqwQl1KeLidJ/0bYNDgyY17BmSHy62bRs+r8HTK936/VAn6InYohAst32q8X
	ALqDn4inB1ppgdcQNQSYWug768gXJtLRWlzruZgKwEcN71xx2JonKdDlWC9P3T81gRlwa1
	+v8fJe+Ncb392mD3XY8og+YP2qDpMgdl1SEPePwFGsksJ8EyoGaPXLU86GKppA==
Date: Tue, 2 May 2023 17:17:54 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Denys Dmytriyenko <denys@konsulko.com>, meta-ti@lists.yoctoproject.org
Subject: check-layer failures for meta-ti
Message-ID: <202305021517546e066d50@mail.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 02 May 2023 15:18:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16470

Hello,

meta-ti is currently failing check-layer-nightly:

https://autobuilder.yoctoproject.org/typhoon/#/builders/121/builds/1325/ste=
ps/19/logs/stdio

AssertionError: Adding layer meta-ti-bsp changed signatures.
703 signatures changed, initial differences (first hash before, second afte=
r):
   cairo:do_prepare_recipe_sysroot: b5f50f60f274a04980d46d1d599e71f1870f937=
bcdbb7a91131a698512663586 -> e1d39b299421d9d76a93765b3bf08218d9fcb1a9539ed8=
5afdfe829152aa69c6
      bitbake-diffsigs --task cairo do_prepare_recipe_sysroot --signature b=
5f50f60f274a04980d46d1d599e71f1870f937bcdbb7a91131a698512663586 e1d39b29942=
1d9d76a93765b3bf08218d9fcb1a9539ed85afdfe829152aa69c6
      NOTE: Starting bitbake server...
      runtaskdeps changed:
      ['autoconf/autoconf_2.71.bb:do_populate_sysroot:virtual:native automa=
ke/automake_1.16.5.bb:do_populate_sysroot:virtual:native cairo/cairo_1.16.0=
=2Ebb:do_fetch fontconfig/fontconfig_2.14.2.bb:do_populate_sysroot gcc/gcc-=
cross_12.2.bb:do_populate_sysroot gcc/gcc-runtime_12.2.bb:do_populate_sysro=
ot glib-2.0/glib-2.0_2.74.6.bb:do_populate_sysroot glibc/glibc_2.37.bb:do_p=
opulate_sysroot gtk-doc/gtk-doc_1.33.2.bb:do_populate_sysroot:virtual:nativ=
e libpng/libpng_1.6.39.bb:do_populate_sysroot libtool/libtool-cross_2.4.7.b=
b:do_populate_sysroot libtool/libtool-native_2.4.7.bb:do_populate_sysroot',=
 -mesa/mesa_23.0.2.bb:do_populate_sysroot, 'pkgconfig/pkgconfig_git.bb:do_p=
opulate_sysroot:virtual:native pseudo/pseudo_git.bb:do_populate_sysroot:vir=
tual:native python/python3_3.11.2.bb:do_populate_sysroot:virtual:native xor=
g-lib/libsm_1.2.4.bb:do_populate_sysroot xorg-lib/libx11_1.8.4.bb:do_popula=
te_sysroot xorg-lib/libxcb_1.15.bb:do_populate_sysroot xorg-lib/libxext_1.3=
=2E5.bb:do_populate_sysroot xorg-lib/libxrender_0.9.11.bb:do_populate_sysro=
ot xorg-lib/pixman_0.42.2.bb:do_populate_sysroot zlib/zlib_1.2.13.bb:do_pop=
ulate_sysroot']
      Number of task dependencies changed
      Dependency on task mesa/mesa_23.0.2.bb:do_populate_sysroot was remove=
d with hash d5185e2720ab1a2fd098a7e2f6fa7864bc1b3cdb5c0063f911ca4564c917eb5a
   kmscube:do_prepare_recipe_sysroot: 3073f347c53ea843501d752cc560dd737dff6=
edc0820e345d629aaeac95e860b -> 73dec75c92794d5c25c8d4ab61ac82eeefc53cb0d46e=
b950819b872e14dbcca8
      bitbake-diffsigs --task kmscube do_prepare_recipe_sysroot --signature=
 3073f347c53ea843501d752cc560dd737dff6edc0820e345d629aaeac95e860b 73dec75c9=
2794d5c25c8d4ab61ac82eeefc53cb0d46eb950819b872e14dbcca8
      NOTE: Starting bitbake server...
      runtaskdeps changed:
      ['gcc/gcc-cross_12.2.bb:do_populate_sysroot gcc/gcc-runtime_12.2.bb:d=
o_populate_sysroot glibc/glibc_2.37.bb:do_populate_sysroot kmscube/kmscube_=
git.bb:do_fetch', -mesa/mesa_23.0.2.bb:do_populate_sysroot, 'meson/meson_1.=
0.1.bb:do_populate_sysroot:virtual:native ninja/ninja_1.11.1.bb:do_populate=
_sysroot:virtual:native pkgconfig/pkgconfig_git.bb:do_populate_sysroot:virt=
ual:native pseudo/pseudo_git.bb:do_populate_sysroot:virtual:native python/p=
ython3_3.11.2.bb:do_populate_sysroot:virtual:native qemu/qemu-native_7.2.0.=
bb:do_populate_sysroot']
      Number of task dependencies changed
      Dependency on task mesa/mesa_23.0.2.bb:do_populate_sysroot was remove=
d with hash d5185e2720ab1a2fd098a7e2f6fa7864bc1b3cdb5c0063f911ca4564c917eb5a
   libepoxy:do_prepare_recipe_sysroot: 500099df0b7dc45367b26d39cfd21f837dc1=
e28c508b48450506e063107d63d3 -> 51b52a4a2a71246b02ffb8916986d0f1683ddab80ff=
8571474744b4e62568e6a
      bitbake-diffsigs --task libepoxy do_prepare_recipe_sysroot --signatur=
e 500099df0b7dc45367b26d39cfd21f837dc1e28c508b48450506e063107d63d3 51b52a4a=
2a71246b02ffb8916986d0f1683ddab80ff8571474744b4e62568e6a
      NOTE: Starting bitbake server...
      runtaskdeps changed:
      ['gcc/gcc-cross_12.2.bb:do_populate_sysroot gcc/gcc-runtime_12.2.bb:d=
o_populate_sysroot glibc/glibc_2.37.bb:do_populate_sysroot libepoxy/libepox=
y_1.5.10.bb:do_fetch', -mesa/mesa_23.0.2.bb:do_populate_sysroot, 'meson/mes=
on_1.0.1.bb:do_populate_sysroot:virtual:native ninja/ninja_1.11.1.bb:do_pop=
ulate_sysroot:virtual:native pkgconfig/pkgconfig_git.bb:do_populate_sysroot=
:virtual:native pseudo/pseudo_git.bb:do_populate_sysroot:virtual:native pyt=
hon/python3_3.11.2.bb:do_populate_sysroot:virtual:native qemu/qemu-native_7=
=2E2.0.bb:do_populate_sysroot xorg-lib/libx11_1.8.4.bb:do_populate_sysroot']
      Number of task dependencies changed
      Dependency on task mesa/mesa_23.0.2.bb:do_populate_sysroot was remove=
d with hash d5185e2720ab1a2fd098a7e2f6fa7864bc1b3cdb5c0063f911ca4564c917eb5a
   libglu:do_prepare_recipe_sysroot: 6486252ed43207ce3c6b7e429026d50cc1c279=
3e69fb92a504cc7c0a01190e36 -> 33a210517fc9b19f1720b97772e88fcb9ee192afba753=
df8a34edb7ba9d1303f
      bitbake-diffsigs --task libglu do_prepare_recipe_sysroot --signature =
6486252ed43207ce3c6b7e429026d50cc1c2793e69fb92a504cc7c0a01190e36 33a210517f=
c9b19f1720b97772e88fcb9ee192afba753df8a34edb7ba9d1303f
      NOTE: Starting bitbake server...
      runtaskdeps changed:
      ['autoconf/autoconf_2.71.bb:do_populate_sysroot:virtual:native automa=
ke/automake_1.16.5.bb:do_populate_sysroot:virtual:native gcc/gcc-cross_12.2=
=2Ebb:do_populate_sysroot gcc/gcc-runtime_12.2.bb:do_populate_sysroot glibc=
/glibc_2.37.bb:do_populate_sysroot libtool/libtool-cross_2.4.7.bb:do_popula=
te_sysroot libtool/libtool-native_2.4.7.bb:do_populate_sysroot mesa/libglu_=
9.0.2.bb:do_fetch', -mesa/mesa_23.0.2.bb:do_populate_sysroot, 'pkgconfig/pk=
gconfig_git.bb:do_populate_sysroot:virtual:native pseudo/pseudo_git.bb:do_p=
opulate_sysroot:virtual:native']
      Number of task dependencies changed
      Dependency on task mesa/mesa_23.0.2.bb:do_populate_sysroot was remove=
d with hash d5185e2720ab1a2fd098a7e2f6fa7864bc1b3cdb5c0063f911ca4564c917eb5a
   libsdl2:do_prepare_recipe_sysroot: 53f34af72e3b35c5cbc7c1a1b519a2d52f2fe=
d5090835b7c827b4c41875bb40a -> 4950e145c52cda51920963267551ca75892b06a57bd2=
2e2523d78a1740238a3f
      bitbake-diffsigs --task libsdl2 do_prepare_recipe_sysroot --signature=
 53f34af72e3b35c5cbc7c1a1b519a2d52f2fed5090835b7c827b4c41875bb40a 4950e145c=
52cda51920963267551ca75892b06a57bd22e2523d78a1740238a3f
      NOTE: Starting bitbake server...
      runtaskdeps changed:
      ['alsa/alsa-lib_1.2.8.bb:do_populate_sysroot cmake/cmake-native_3.25.=
2.bb:do_populate_sysroot gcc/gcc-cross_12.2.bb:do_populate_sysroot gcc/gcc-=
runtime_12.2.bb:do_populate_sysroot glibc/glibc_2.37.bb:do_populate_sysroot=
 libsdl2/libsdl2_2.26.5.bb:do_fetch', -mesa/mesa_23.0.2.bb:do_populate_sysr=
oot, 'ninja/ninja_1.11.1.bb:do_populate_sysroot:virtual:native pkgconfig/pk=
gconfig_git.bb:do_populate_sysroot:virtual:native pseudo/pseudo_git.bb:do_p=
opulate_sysroot:virtual:native pulseaudio/pulseaudio_16.1.bb:do_populate_sy=
sroot wayland/wayland-protocols_1.31.bb:do_populate_sysroot wayland/wayland=
_1.22.0.bb:do_populate_sysroot wayland/wayland_1.22.0.bb:do_populate_sysroo=
t:virtual:native xorg-lib/libx11_1.8.4.bb:do_populate_sysroot xorg-lib/libx=
ext_1.3.5.bb:do_populate_sysroot xorg-lib/libxkbcommon_1.5.0.bb:do_populate=
_sysroot xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot xorg-lib/libxrende=
r_0.9.11.bb:do_populate_sysroot']
      Number of task dependencies changed
      Dependency on task mesa/mesa_23.0.2.bb:do_populate_sysroot was remove=
d with hash d5185e2720ab1a2fd098a7e2f6fa7864bc1b3cdb5c0063f911ca4564c917eb5a
   libva:do_prepare_recipe_sysroot: f5a7c3d9b812f178fa3ac271a92885b07533725=
6a1d85856e9482f6cdeb8897a -> 91b774268e29e0cad0f351ea9cd632ca90631205cde588=
f7a116351e81123959
      bitbake-diffsigs --task libva do_prepare_recipe_sysroot --signature f=
5a7c3d9b812f178fa3ac271a92885b075337256a1d85856e9482f6cdeb8897a 91b774268e2=
9e0cad0f351ea9cd632ca90631205cde588f7a116351e81123959
      NOTE: Starting bitbake server...
      runtaskdeps changed:
      ['drm/libdrm_2.4.115.bb:do_populate_sysroot gcc/gcc-cross_12.2.bb:do_=
populate_sysroot gcc/gcc-runtime_12.2.bb:do_populate_sysroot glibc/glibc_2.=
37.bb:do_populate_sysroot libva/libva_2.16.0.bb:do_fetch', -mesa/mesa_23.0.=
2.bb:do_populate_sysroot, 'meson/meson_1.0.1.bb:do_populate_sysroot:virtual=
:native ninja/ninja_1.11.1.bb:do_populate_sysroot:virtual:native pkgconfig/=
pkgconfig_git.bb:do_populate_sysroot:virtual:native pseudo/pseudo_git.bb:do=
_populate_sysroot:virtual:native python/python3_3.11.2.bb:do_populate_sysro=
ot:virtual:native qemu/qemu-native_7.2.0.bb:do_populate_sysroot wayland/way=
land_1.22.0.bb:do_populate_sysroot wayland/wayland_1.22.0.bb:do_populate_sy=
sroot:virtual:native xorg-lib/libx11_1.8.4.bb:do_populate_sysroot xorg-lib/=
libxext_1.3.5.bb:do_populate_sysroot xorg-lib/libxfixes_6.0.0.bb:do_populat=
e_sysroot']
      Number of task dependencies changed
      Dependency on task mesa/mesa_23.0.2.bb:do_populate_sysroot was remove=
d with hash d5185e2720ab1a2fd098a7e2f6fa7864bc1b3cdb5c0063f911ca4564c917eb5a
   libwpe:do_prepare_recipe_sysroot: 79f4cda8e4538edef7d293d767f67ca7f5433f=
39f6bfb051dd9761611f8803fc -> aeaaa1229872bf186608c62e4f0451d1a64a0d3a50884=
f2a1c52396fe372e84a
      bitbake-diffsigs --task libwpe do_prepare_recipe_sysroot --signature =
79f4cda8e4538edef7d293d767f67ca7f5433f39f6bfb051dd9761611f8803fc aeaaa12298=
72bf186608c62e4f0451d1a64a0d3a50884f2a1c52396fe372e84a
      NOTE: Starting bitbake server...
      runtaskdeps changed:
      ['cmake/cmake-native_3.25.2.bb:do_populate_sysroot gcc/gcc-cross_12.2=
=2Ebb:do_populate_sysroot gcc/gcc-runtime_12.2.bb:do_populate_sysroot glibc=
/glibc_2.37.bb:do_populate_sysroot', -mesa/mesa_23.0.2.bb:do_populate_sysro=
ot, 'ninja/ninja_1.11.1.bb:do_populate_sysroot:virtual:native pkgconfig/pkg=
config_git.bb:do_populate_sysroot:virtual:native pseudo/pseudo_git.bb:do_po=
pulate_sysroot:virtual:native webkit/libwpe_1.14.1.bb:do_fetch xorg-lib/lib=
xkbcommon_1.5.0.bb:do_populate_sysroot']
      Number of task dependencies changed
      Dependency on task mesa/mesa_23.0.2.bb:do_populate_sysroot was remove=
d with hash d5185e2720ab1a2fd098a7e2f6fa7864bc1b3cdb5c0063f911ca4564c917eb5a
   vulkan-loader:do_package_qa: 968a580bd9418b0d900dd0413b649a9f78d318a8f93=
9ccf32ba0d86617427f44 -> fcb58f3f699d885b706d3571ed2250fc48f1bafde00869ee23=
1d41292d65de36
      bitbake-diffsigs --task vulkan-loader do_package_qa --signature 968a5=
80bd9418b0d900dd0413b649a9f78d318a8f939ccf32ba0d86617427f44 fcb58f3f699d885=
b706d3571ed2250fc48f1bafde00869ee231d41292d65de36
      NOTE: Starting bitbake server...
      runtaskdeps changed:
      ['binutils/binutils-cross_2.40.bb:do_populate_sysroot', -mesa/mesa_23=
=2E0.2.bb:do_packagedata, 'pseudo/pseudo_git.bb:do_populate_sysroot:virtual=
:native vulkan/vulkan-loader_1.3.239.0.bb:do_package vulkan/vulkan-loader_1=
=2E3.239.0.bb:do_packagedata']
      Number of task dependencies changed
      Dependency on task mesa/mesa_23.0.2.bb:do_packagedata was removed wit=
h hash 271f91ed954051f6e3331c53330eaa8142b5f343622be9e5e41f5fc3a5378d74
   vulkan-loader:do_package_write_rpm: 079882994f2155f7364d4e6d6cb7e7c4b918=
6f7868c9d538d4543b788807540a -> 421b110df4ca4f028eb5332331f1114500ce9a16eb1=
677f34bf16fcc35d61543
      bitbake-diffsigs --task vulkan-loader do_package_write_rpm --signatur=
e 079882994f2155f7364d4e6d6cb7e7c4b9186f7868c9d538d4543b788807540a 421b110d=
f4ca4f028eb5332331f1114500ce9a16eb1677f34bf16fcc35d61543
      NOTE: Starting bitbake server...
      runtaskdeps changed:
      ['gcc/gcc-runtime_12.2.bb:do_packagedata glibc/glibc_2.37.bb:do_packa=
gedata', -mesa/mesa_23.0.2.bb:do_packagedata, 'pseudo/pseudo_git.bb:do_popu=
late_sysroot:virtual:native rpm/rpm_4.18.0.bb:do_populate_sysroot:virtual:n=
ative vulkan/vulkan-headers_1.3.239.0.bb:do_packagedata vulkan/vulkan-loade=
r_1.3.239.0.bb:do_deploy_source_date_epoch vulkan/vulkan-loader_1.3.239.0.b=
b:do_package vulkan/vulkan-loader_1.3.239.0.bb:do_packagedata wayland/wayla=
nd_1.22.0.bb:do_packagedata xorg-lib/libx11_1.8.4.bb:do_packagedata xorg-li=
b/libxcb_1.15.bb:do_packagedata xorg-lib/libxrandr_1.5.3.bb:do_packagedata']
      Number of task dependencies changed
      Dependency on task mesa/mesa_23.0.2.bb:do_packagedata was removed wit=
h hash 271f91ed954051f6e3331c53330eaa8142b5f343622be9e5e41f5fc3a5378d74
   waffle:do_prepare_recipe_sysroot: 62fcece80e40b15fc8f1d5074554b2f2f04294=
a325987b70a6c6f8c85c69751b -> 8ff1cee7efa9775394fd0958ce432805bfdd5b3f72325=
c670ec8e6dd429e5c0e
      bitbake-diffsigs --task waffle do_prepare_recipe_sysroot --signature =
62fcece80e40b15fc8f1d5074554b2f2f04294a325987b70a6c6f8c85c69751b 8ff1cee7ef=
a9775394fd0958ce432805bfdd5b3f72325c670ec8e6dd429e5c0e
      NOTE: Starting bitbake server...
      runtaskdeps changed:
      ['bash-completion/bash-completion_2.11.bb:do_populate_sysroot cmake/c=
make-native_3.25.2.bb:do_populate_sysroot gcc/gcc-cross_12.2.bb:do_populate=
_sysroot gcc/gcc-runtime_12.2.bb:do_populate_sysroot glibc/glibc_2.37.bb:do=
_populate_sysroot', -mesa/mesa_23.0.2.bb:do_populate_sysroot, 'meson/meson_=
1.0.1.bb:do_populate_sysroot:virtual:native ninja/ninja_1.11.1.bb:do_popula=
te_sysroot:virtual:native pkgconfig/pkgconfig_git.bb:do_populate_sysroot:vi=
rtual:native pseudo/pseudo_git.bb:do_populate_sysroot:virtual:native python=
/python3_3.11.2.bb:do_populate_sysroot python/python3_3.11.2.bb:do_populate=
_sysroot:virtual:native qemu/qemu-native_7.2.0.bb:do_populate_sysroot udev/=
eudev_3.2.11.bb:do_populate_sysroot waffle/waffle_1.7.0.bb:do_fetch wayland=
/wayland-protocols_1.31.bb:do_populate_sysroot wayland/wayland_1.22.0.bb:do=
_populate_sysroot wayland/wayland_1.22.0.bb:do_populate_sysroot:virtual:nat=
ive xorg-lib/libx11_1.8.4.bb:do_populate_sysroot xorg-lib/libxcb_1.15.bb:do=
_populate_sysroot']
      Number of task dependencies changed
      Dependency on task mesa/mesa_23.0.2.bb:do_populate_sysroot was remove=
d with hash d5185e2720ab1a2fd098a7e2f6fa7864bc1b3cdb5c0063f911ca4564c917eb5a


--=20
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

