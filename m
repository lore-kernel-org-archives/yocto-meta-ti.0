Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8ACDE668B6
	for <webhook@archiver.kernel.org>; Sat, 20 Dec 2025 15:08:17 +0000 (UTC)
Subject: Re: [scarthgap][PATCH v2] trusted-firmware-a/optee-os: Add LPM support on few platforms
To: meta-ti@lists.yoctoproject.org
From: "Yan, Haixiao (CN)" <Haixiao.Yan.CN@windriver.com>
X-Originating-Location: KR (61.107.31.5)
X-Originating-Platform: Windows Firefox 146
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sat, 20 Dec 2025 07:08:14 -0800
References: <20251128184125.3220124-1-m-chawdhry@ti.com> <20251128185058.4131726-1-prc@list.ti.com>
In-Reply-To: <20251128185058.4131726-1-prc@list.ti.com>
Message-ID: <281355.1766243294658107429@lists.yoctoproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 20 Dec 2025 15:08:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19384

This patch failed to apply on scarthgap.
the version of trusted-firmware-a is 2.10.4, the patch is not suitable for =
this version.

NOTE: Applying patch '0001-feat-k3-choose-cluster_start_id-depending-on-the=
-soc.patch' (../layers/meta-ti/meta-ti-bsp/recipes-bsp/trusted-firmware-a/t=
rusted-firmware-a/0001-feat-k3-choose-cluster_start_id-depending-on-the-soc=
.patch)
NOTE: Applying patch '0002-feat-ti-add-message-to-encrypt-tfa-during-suspen=
d.patch' (../layers/meta-ti/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trus=
ted-firmware-a/0002-feat-ti-add-message-to-encrypt-tfa-during-suspend.patch=
)
ERROR: Applying patch '0002-feat-ti-add-message-to-encrypt-tfa-during-suspe=
nd.patch' on target directory '/build-ti/tmp-glibc/work/ti_j78xx-wrs-linux/=
trusted-firmware-a/2.10+git/git'
CmdError('quilt --quiltrc /build-ti/tmp-glibc/work/ti_j78xx-wrs-linux/trust=
ed-firmware-a/2.10+git/recipe-sysroot-native/etc/quiltrc push', 0, "stdout:=
 Applying patch 0002-feat-ti-add-message-to-encrypt-tfa-during-suspend.patc=
h
can't find file to patch at input line 39
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|From c79ff3679a4360bb848b01d4036c365533fcf791 Mon Sep 17 00:00:00 2001
|From: Richard Genoud <richard.genoud@bootlin.com>
|Date: Tue, 11 Feb 2025 18:20:17 +0100
|Subject: [PATCH 2/3] feat(ti): add message to encrypt tfa during suspend
|
|At suspend, BL31 with its context will be encrypted by TIFS in DDR.
|Encryption is needed for security matters, so that the BL31 is not
|modified before entering suspend or early at resume.
|
|We only need the encryption function here because the decryption message
|will be send by the R5 SPL at resume.
|
|Also introduce the LPM_ENCRYPT_IMAGE cap signals that FW has the support
|to encrypt the image using the TISCI_MSG_LPM_ENCRYPT tisci message.
|
|This is useful in suspend to ram cases where we would like to
|store the encrypted image of a secure fw instead of the original image
|itself in the DDR.
|
|Check for LPM_ENCRYPT_IMAGE flag in the FW capabilities, and only then
|call encrypt.
|
|Upstream-Status: Pending
|
|Change-Id: I266472da87dd0821493019b2d9853f8886f33811
|Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
|Signed-off-by: Abhash Kumar Jha <a-kumar2@ti.com>
|---
| drivers/ti/ti_sci/ti_sci.c          | 36 +++++++++++++++++++++++++++++
| drivers/ti/ti_sci/ti_sci.h          |  7 ++++++
| drivers/ti/ti_sci/ti_sci_protocol.h | 32 +++++++++++++++++++++++++
| plat/ti/k3/common/k3_psci.c         | 10 ++++++++
| 4 files changed, 85 insertions(+)
|
|diff --git a/drivers/ti/ti_sci/ti_sci.c b/drivers/ti/ti_sci/ti_sci.c
|index f0813e5b0..ee5f7166f 100644
|--- a/drivers/ti/ti_sci/ti_sci.c
|+++ b/drivers/ti/ti_sci/ti_sci.c
--------------------------
No file to patch.  Skipping patch.
1 out of 1 hunk ignored
can't find file to patch at input line 83
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|diff --git a/drivers/ti/ti_sci/ti_sci.h b/drivers/ti/ti_sci/ti_sci.h
|index 1f1963274..2afa11317 100644
|--- a/drivers/ti/ti_sci/ti_sci.h
|+++ b/drivers/ti/ti_sci/ti_sci.h
--------------------------
No file to patch.  Skipping patch.
2 out of 2 hunks ignored
can't find file to patch at input line 107
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|diff --git a/drivers/ti/ti_sci/ti_sci_protocol.h b/drivers/ti/ti_sci/ti_sc=
i_protocol.h
|index bdd24622a..a165cda99 100644
|--- a/drivers/ti/ti_sci/ti_sci_protocol.h
|+++ b/drivers/ti/ti_sci/ti_sci_protocol.h
--------------------------
No file to patch.  Skipping patch.
3 out of 3 hunks ignored
patching file plat/ti/k3/common/k3_psci.c
Hunk #2 succeeded at 269 with fuzz 1 (offset -14 lines).
Hunk #3 succeeded at 321 (offset -32 lines).
Patch 0002-feat-ti-add-message-to-encrypt-tfa-during-suspend.patch does not=
 apply (enforce with -f)

