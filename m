Return-Path: <e-ruei1@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C2F34E00E6B; Mon,  9 Jul 2018 09:35:55 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A90B2E00E4B
	for <meta-ti@yoctoproject.org>; Mon,  9 Jul 2018 09:35:54 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w69GZsPR090326
	for <meta-ti@yoctoproject.org>; Mon, 9 Jul 2018 11:35:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1531154154;
	bh=dy0Co6ugDgtY6Lxfdhs382yvoEHfbLWJQsf+U4L6ISM=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=MRRcgaEc0li0zPUDt0/V0MxWI4BFYEKDHdadg/Z0fJTvn1EIb8ZwRKacLUGfirHvV
	zP+hD4elYUJK2Wl9t62vYCyugzYQPknssofryukZUPZqnssSlZGRbix1IdEz1LaWJr
	pEK8mloZmV0OULXEw/nfwQ7VXUmEKVcISRLQaqzc=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w69GZsZP028237
	for <meta-ti@yoctoproject.org>; Mon, 9 Jul 2018 11:35:54 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 9 Jul 2018 11:35:54 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 9 Jul 2018 11:35:53 -0500
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w69GZrLg002933
	for <meta-ti@yoctoproject.org>; Mon, 9 Jul 2018 11:35:53 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 9 Jul 2018 12:35:46 -0400
Message-ID: <1531154148-30707-2-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1531154148-30707-1-git-send-email-e-ruei1@ti.com>
References: <1531154148-30707-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 1/3] conf: machine: k3: enable sgx
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Jul 2018 16:35:55 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 conf/machine/include/k3.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/machine/include/k3.inc b/conf/machine/include/k3.inc
index 96699db..b9374e3 100644
--- a/conf/machine/include/k3.inc
+++ b/conf/machine/include/k3.inc
@@ -28,5 +28,5 @@ MACHINE_GUI_CLASS = "smallscreen"
 UBI_VOLNAME = "rootfs"
 
 # List common SoC features, may need to add touchscreen for specific machines
-MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen alsa ethernet pci"
+MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen alsa ethernet pci sgx"
 # Not ready yet - sgx dsp mmip
-- 
1.9.1


