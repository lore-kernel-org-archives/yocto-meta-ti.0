Subject: Setting up Build-Environment for BeagleBone Black with meta-ti
To: meta-ti@lists.yoctoproject.org
From: "Sebastian" <sebastian.krahl@lacon.de>
X-Originating-Location: Unterschleissheim, Bavaria, DE (188.195.170.126)
X-Originating-Platform: Windows Firefox 87
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 22 Apr 2021 01:46:38 -0700
Message-ID: <bjdh.1619081198829695553.NA6r@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="AXU8YOCBCrohhWymnvac"

--AXU8YOCBCrohhWymnvac
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

I'm struggeling to get my BBB running with meta-ti. I have a build environ=
ment setup with Ubuntu 18.04. I have started with plain yocto and everythin=
g builds fine with beaglebone-yocto.

Now I want to get in touch with the pru-icss but that is available only in=
 meta-ti as I've read so far.

* I've cloned again poky, meta-ti and meta-arm. Into ~/yocto
* Started with source poky/oe-build-environment build
* Edited conf/local.conf

* added MACHINE ?=3D "am335x-evm"

* Added the layers:

* bitbake-layers add-layer ../meta-arm/meta-arm-toolchain
* bitbake-layers add-layer ../meta-arm/meta-arm
* bitbake-layers add-layer ../meta-ti

* Started the build bitbake core-image-base

What I've read so far was to use the ti2020.00 branch of meta-ti and the y=
octo-3.2 branch of poky.

The build completes without any error and I get the wic.zx, but when I tak=
e the content and burn it onto my SD-Card there is no dtb in the boot folde=
r and there is also no lifesign when I'm booting the BBB with S2 pressed.

Where is my mistake?

Regards,

Sebastian

--AXU8YOCBCrohhWymnvac
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,<br /><br />I'm struggeling to get my BBB running with meta-ti. I have a=
 build environment setup with Ubuntu 18.04. I have started with plain yocto=
 and everything builds fine with beaglebone-yocto.<br /><br />Now I want to=
 get in touch with the pru-icss but that is available only in meta-ti as I'=
ve read so far.<br />
<ul>
<li>I've cloned again poky, meta-ti and meta-arm. Into ~/yocto</li>
<li>Started with source poky/oe-build-environment build</li>
<li>Edited conf/local.conf
<ul>
<li>added MACHINE ?=3D "am335x-evm"</li>
</ul>
</li>
<li>Added the layers:
<ul>
<li>bitbake-layers add-layer ../meta-arm/meta-arm-toolchain</li>
<li>bitbake-layers add-layer ../meta-arm/meta-arm</li>
<li>bitbake-layers add-layer ../meta-ti</li>
</ul>
</li>
<li>Started the build bitbake core-image-base</li>
</ul>
What I've read so far was to use the ti2020.00 branch of meta-ti and the y=
octo-3.2 branch of poky.<br /><br />The build completes without any error a=
nd I get the wic.zx, but when I take the content and burn it onto my SD-Car=
d there is no dtb in the boot folder and there is also no lifesign when I'm=
 booting the BBB with S2 pressed.<br /><br />Where is my mistake?<br /><br =
/>Regards,<br /><br />Sebastian

--AXU8YOCBCrohhWymnvac--
