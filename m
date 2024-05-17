Return-Path: <christophercordahi@nanometrics.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1674DC25B74
	for <webhook@archiver.kernel.org>; Fri, 17 May 2024 02:04:12 +0000 (UTC)
Subject: Has the TI download host changed?
To: meta-ti@lists.yoctoproject.org
From: christophercordahi@nanometrics.ca
X-Originating-Location: Ottawa, Ontario, CA (99.209.71.194)
X-Originating-Platform: Linux Chrome 124
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 16 May 2024 19:04:04 -0700
Message-ID: <BAlN.1715902609339619438.uywV@lists.yoctoproject.org>
X-Old-Date: Thu, 16 May 2024 16:36:49 -0700
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 17 May 2024 02:04:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17660
Message-ID: <20240517020404.XnDT4HYiav5xc79aH8vYmImsqzzD8D8g1yVGybZdUB8@z>

Apologies if this is the wrong place to ask.
I'm asking here because I'm encountering issues fetching the SRC_URI for th=
e ti-xdctools_3.55.02.22.bb recipe.

I'm using the dunfell branch that may now be EOL
https://git.yoctoproject.org/meta-ti/tree/recipes-ti/devtools/ti-xdctools-c=
ore.inc?h=3Ddunfell#n5
however the same URL is in HEAD
https://git.yoctoproject.org/meta-ti/tree/meta-ti-extras/recipes-ti/devtool=
s/ti-xdctools_3.55.02.22.bb#n74

Only 28 M of the necessary 97 M are downloaded using the command
wget http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/rts=
c/3_55_02_22/exports/xdccore/xdctools_3_55_02_22_core_linux.zip
There=E2=80=99s a notice about redirecting the http request to https, but t=
he outcome is the same if https is specified.

The TI XDCtools  3_55_02_22 web page links to downloads.ti.com, not softwar=
e-dl.ti.com as used in the recipe.
https://downloads.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/rtsc/3_55=
_02_22/index_FDS.html
The file is successfully downloaded from downloads.ti.com using https or ht=
tp (without redirection to https)

Is this a temporary problem that TI will correct, or should this recipe be =
updated?
Will other recipes that download from software-dl.ti.com be affected also?
This fetch succeeded as recently as May 5.

