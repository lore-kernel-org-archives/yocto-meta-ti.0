Subject: Fit Image creation for beagle-bone with Meta TI layer
To: meta-ti@lists.yoctoproject.org
From: rohitpai77@gmail.com
X-Originating-Location: Bengaluru, Karnataka, IN (49.206.12.2)
X-Originating-Platform: Linux Chrome 80
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 22 Jun 2020 23:51:08 -0700
Message-ID: <nOqE.1592895068258132101.5v0z@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="6LHKUT2Dcc2MEk8ET5yk"

--6LHKUT2Dcc2MEk8ET5yk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dear Meta TI Team,

I am trying to create fit image for my beaglebone with meta-ti layer. All =
other image formats work just fine.
I am using the beaglebone.conf provided inside the meta-ti layer. I have a=
dded below changes in the machine.conf file to generate fit image.

beaglebone.conf
--------------
# fit image
KERNEL_CLASSES +=3D "kernel-fitimage"
KERNEL_IMAGETYPE =3D "fitImage"
--------------

I get below error
----------------------
ERROR: bbb-image-play-1.0-r0 do_rootfs: Could not invoke dnf. Command '/me=
dia/workdir/bbb/yocto/beaglebone/build/tmp/work/beaglebone-poky-linux-gnuea=
bi/bbb-image-play/1.0-r0/recipe-sysroot-native/usr/bin/dnf -v --rpmverbosit=
y=3Dinfo -y -c /media/workdir/bbb/yocto/beaglebone/build/tmp/work/beaglebon=
e-poky-linux-gnueabi/bbb-image-play/1.0-r0/rootfs/etc/dnf/dnf.conf --setopt=
=
=3Dreposdir=3D/media/workdir/bbb/yocto/beaglebone/build/tmp/work/beaglebon=
e-poky-linux-gnueabi/bbb-image-play/1.0-r0/rootfs/etc/yum.repos.d --install=
root=3D/media/workdir/bbb/yocto/beaglebone/build/tmp/work/beaglebone-poky-l=
inux-gnueabi/bbb-image-play/1.0-r0/rootfs --setopt=3Dlogdir=3D/media/workdi=
r/bbb/yocto/beaglebone/build/tmp/work/beaglebone-poky-linux-gnueabi/bbb-ima=
ge-play/1.0-r0/temp --repofrompath=3Doe-repo,/media/workdir/bbb/yocto/beagl=
ebone/build/tmp/work/beaglebone-poky-linux-gnueabi/bbb-image-play/1.0-r0/oe=
-rootfs-repo --nogpgcheck install dosfstools e2fsprogs e2fsprogs-mke2fs hel=
lo-application libhello-lib0 libhiredis0.13 initscript kernel-devicetree ke=
rnel-image-zimage kernel-module-i2cplay kernel-module-mcp320x libgpiod libs=
tdc++6 openssh packagegroup-core-boot rauc redis run-postinsts u-boot-fw-ut=
ils util-linux-mkfs' returned 1:
DNF version: 4.1.0
cachedir: /media/workdir/bbb/yocto/beaglebone/build/tmp/work/beaglebone-po=
ky-linux-gnueabi/bbb-image-play/1.0-r0/rootfs/var/cache/dnf
Added oe-repo repo from /media/workdir/bbb/yocto/beaglebone/build/tmp/work=
/beaglebone-poky-linux-gnueabi/bbb-image-play/1.0-r0/oe-rootfs-repo
repo: using cache for: oe-repo
not found other for:
not found modules for:
not found deltainfo for:
not found updateinfo for:
oe-repo: using metadata from Tue 23 Jun 2020 06:41:05 AM UTC.
Last metadata expiration check: 0:00:01 ago on Tue 23 Jun 2020 06:41:06 AM=
 UTC.
No module defaults found
No match for argument: kernel-image-zimage
Error: Unable to find a match

ERROR: bbb-image-play-1.0-r0 do_rootfs:
ERROR: bbb-image-play-1.0-r0 do_rootfs: Function failed: do_rootfs
ERROR: Logfile of failure stored in: /media/workdir/bbb/yocto/beaglebone/b=
uild/tmp/work/beaglebone-poky-linux-gnueabi/bbb-image-play/1.0-r0/temp/log.=
do_rootfs.21662
ERROR: Task (/media/workdir/bbb/yocto/beaglebone/meta-sysplay/images/bbb-i=
mage-play.bb:do_rootfs) failed with exit code '1'
NOTE: Tasks Summary: Attempted 3146 tasks of which 3144 didn't need to be =
rerun and 1 failed.
----------------------

if I try below changes
KERNEL_IMAGETYPE =3D "zImage fitImage"

then I get below error
ERROR: linux-ti-staging-rt-5.4.28+gitAUTOINC+c3dd64420d-r22a do_package: Q=
A Issue: kernel-image-zimage is listed in PACKAGES multiple times, this lea=
ds to packaging errors. [packages-list]
ERROR: linux-ti-staging-rt-5.4.28+gitAUTOINC+c3dd64420d-r22a do_package: Q=
A Issue: kernel-image-fitimage is listed in PACKAGES multiple times, this l=
eads to packaging errors. [packages-list]

Please suggest what is the correct way to get fitimage (kernel + DTB) with=
 meta-ti layer.
Thanks for your support.

--6LHKUT2Dcc2MEk8ET5yk
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dear Meta TI Team,&nbsp;<br /><br />I am trying to create fit image for my =
beaglebone with meta-ti layer. All other image formats work just fine.&nbsp=
;<br />I am using the beaglebone.conf provided inside the meta-ti layer. I =
have added below changes in the machine.conf file to generate fit image.&nb=
sp;<br /><br />beaglebone.conf&nbsp;<br />--------------<br />
<div style=3D"color: #d4d4d4; background-color: #1e1e1e; font-family: 'Dro=
id Sans Mono', monospace, monospace, 'Droid Sans Fallback'; line-height: 19=
px; white-space: pre;">
<div><span style=3D"color: #6a9955;"># fit image </span></div>
<div>KERNEL_CLASSES +=3D <span style=3D"color: #ce9178;">"kernel-fitimage"=
</span></div>
<div><span style=3D"color: #569cd6;">KERNEL_IMAGETYPE</span> =3D <span sty=
le=3D"color: #ce9178;">"fitImage"</span></div>
</div>
--------------<br /><br />I get below error&nbsp;<br />-------------------=
---<br />
<div>ERROR: bbb-image-play-1.0-r0 do_rootfs: Could not invoke dnf. Command=
 '/media/workdir/bbb/yocto/beaglebone/build/tmp/work/beaglebone-poky-linux-=
gnueabi/bbb-image-play/1.0-r0/recipe-sysroot-native/usr/bin/dnf -v --rpmver=
bosity=3Dinfo -y -c /media/workdir/bbb/yocto/beaglebone/build/tmp/work/beag=
lebone-poky-linux-gnueabi/bbb-image-play/1.0-r0/rootfs/etc/dnf/dnf.conf --s=
etopt=3Dreposdir=3D/media/workdir/bbb/yocto/beaglebone/build/tmp/work/beagl=
ebone-poky-linux-gnueabi/bbb-image-play/1.0-r0/rootfs/etc/yum.repos.d --ins=
tallroot=3D/media/workdir/bbb/yocto/beaglebone/build/tmp/work/beaglebone-po=
ky-linux-gnueabi/bbb-image-play/1.0-r0/rootfs --setopt=3Dlogdir=3D/media/wo=
rkdir/bbb/yocto/beaglebone/build/tmp/work/beaglebone-poky-linux-gnueabi/bbb=
-image-play/1.0-r0/temp --repofrompath=3Doe-repo,/media/workdir/bbb/yocto/b=
eaglebone/build/tmp/work/beaglebone-poky-linux-gnueabi/bbb-image-play/1.0-r=
0/oe-rootfs-repo --nogpgcheck install dosfstools e2fsprogs e2fsprogs-mke2fs=
 hello-application libhello-lib0 libhiredis0.13 initscript kernel-devicetre=
e kernel-image-zimage kernel-module-i2cplay kernel-module-mcp320x libgpiod =
libstdc++6 openssh packagegroup-core-boot rauc redis run-postinsts u-boot-f=
w-utils util-linux-mkfs' returned 1:</div>
<div>DNF version: 4.1.0</div>
<div>cachedir: /media/workdir/bbb/yocto/beaglebone/build/tmp/work/beaglebo=
ne-poky-linux-gnueabi/bbb-image-play/1.0-r0/rootfs/var/cache/dnf</div>
<div>Added oe-repo repo from /media/workdir/bbb/yocto/beaglebone/build/tmp=
/work/beaglebone-poky-linux-gnueabi/bbb-image-play/1.0-r0/oe-rootfs-repo</d=
iv>
<div>repo: using cache for: oe-repo</div>
<div>not found other for:&nbsp;</div>
<div>not found modules for:&nbsp;</div>
<div>not found deltainfo for:&nbsp;</div>
<div>not found updateinfo for:&nbsp;</div>
<div>oe-repo: using metadata from Tue 23 Jun 2020 06:41:05 AM UTC.</div>
<div>Last metadata expiration check: 0:00:01 ago on Tue 23 Jun 2020 06:41:=
06 AM UTC.</div>
<div>No module defaults found</div>
<div>No match for argument: kernel-image-zimage</div>
<div>Error: Unable to find a match</div>
<div>&nbsp;</div>
<div>ERROR: bbb-image-play-1.0-r0 do_rootfs:&nbsp;</div>
<div>ERROR: bbb-image-play-1.0-r0 do_rootfs: Function failed: do_rootfs</d=
iv>
<div>ERROR: Logfile of failure stored in: /media/workdir/bbb/yocto/beagleb=
one/build/tmp/work/beaglebone-poky-linux-gnueabi/bbb-image-play/1.0-r0/temp=
/log.do_rootfs.21662</div>
<div>ERROR: Task (/media/workdir/bbb/yocto/beaglebone/meta-sysplay/images/=
bbb-image-play.bb:do_rootfs) failed with exit code '1'</div>
<div>NOTE: Tasks Summary: Attempted 3146 tasks of which 3144 didn't need t=
o be rerun and 1 failed.</div>
<div>----------------------</div>
<br />if I try below changes&nbsp;<br />
<div style=3D"color: #d4d4d4; background-color: #1e1e1e; font-family: 'Dro=
id Sans Mono', monospace, monospace, 'Droid Sans Fallback'; line-height: 19=
px; white-space: pre;"><span style=3D"color: #569cd6;">KERNEL_IMAGETYPE</sp=
an> =3D <span style=3D"color: #ce9178;">"zImage fitImage"<br /></span></div=
>
<br />then I get below error&nbsp;<br />
<div>ERROR: linux-ti-staging-rt-5.4.28+gitAUTOINC+c3dd64420d-r22a do_packa=
ge: QA Issue: kernel-image-zimage is listed in PACKAGES multiple times, thi=
s leads to packaging errors. [packages-list]</div>
<div>ERROR: linux-ti-staging-rt-5.4.28+gitAUTOINC+c3dd64420d-r22a do_packa=
ge: QA Issue: kernel-image-fitimage is listed in PACKAGES multiple times, t=
his leads to packaging errors. [packages-list]</div>
<div><br /><br />Please suggest what is the correct way to get fitimage (k=
ernel + DTB) with meta-ti layer.&nbsp;<br />Thanks for your support.&nbsp;<=
br /><br /><br /><br /><br /></div>

--6LHKUT2Dcc2MEk8ET5yk--
