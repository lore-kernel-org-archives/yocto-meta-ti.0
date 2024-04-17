Return-Path: <katutxakurra@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43ABCC4345F
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 13:39:03 +0000 (UTC)
Subject: gpiochip order unexpected, device tree gpio0 becomes /dev/gpiochip3
To: meta-ti@lists.yoctoproject.org
From: "Katu Txakur" <katutxakurra@gmail.com>
X-Originating-Location: El Escorial, Madrid, ES (88.13.48.164)
X-Originating-Platform: Windows Firefox 124
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 17 Apr 2024 06:39:02 -0700
Message-ID: <Ku97.1713361142125953430.tHf7@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 17 Apr 2024 13:39:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17572

Hi,

I've built a, Yocto scarthgap, core-image-minimal for the machine=3Dbeagleb=
one. When I booted what it's defined as gpio0 in the device tree, it become=
s /dev/gpiochip3. The rest are in order.=20
This also happened using the beaglebone-yocto machine.
This also happened using the beaglebone-yocto machine in Yocto kirkstone br=
anch.

Below the core-image-minimal.yaml file that I used to create the image.
I had to manually edit /boot/extlinux/extlinux.conf and delete the root pas=
sword manually, but I'm not asking about that.

Also the meta-arm doesn't seem to have a scarthgap branch, I used master.

Thank you,
Katu

header:
  version: 1

distro: poky
machine: beaglebone

repos:
  poky:
    url: http://git.yoctoproject.org/poky
    branch: scarthgap
    layers:
      meta:
      meta-poky:
      meta-yocto-bsp:
  meta-arm:
    url: https://git.yoctoproject.org/meta-arm
    branch: master
    layers:
      meta-arm:
      meta-arm-bsp:
      meta-arm-systemready:
      meta-arm-toolchain:
  meta-ti:
    url: https://git.yoctoproject.org/meta-ti
    branch: scarthgap
    commit: 5c049dcb30d7a644333762198771d7fd3795b686
    layers:
      meta-ti-bsp:
      meta-ti-extras:
  meta-openembedded:
    url: https://github.com/openembedded/meta-openembedded.git
    branch: scarthgap
    commit: 1731d7ca9c75039040f8ce98009c2761707a9671
    layers:
      meta-oe:
      meta-networking:
      meta-python:

local_conf_header:
  base: |
    CONF_VERSION =3D "2"
    INIT_MANAGER =3D "systemd"

target:
  - core-image-minimal
local_conf_header:
    custom-local-conf: |
        ACCEPT_FSL_EULA =3D "1"
        # Switch to Debian packaging and include package-management in the =
image
        PACKAGE_CLASSES =3D "package_deb"
        EXTRA_IMAGE_FEATURES +=3D "package-management"
        LICENSE_FLAGS_ACCEPTED =3D "commercial"
    standard: |
        CONF_VERSION =3D "2"
    folders: |
        BB_GENERATE_MIRROR_TARBALLS =3D "1"
        DEPLOY_DIR =3D "${TOPDIR}/deploy"
        SSTATE_DIR =3D "${TOPDIR}/sstate-cache"
    rmwork: |
        INHERIT +=3D "rm_work"
    other: |
        EXTRA_IMAGE_FEATURES ?=3D "debug-tweaks"

