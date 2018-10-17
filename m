Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 68E60E00B5E; Wed, 17 Oct 2018 13:02:10 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (raj.khem[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.214.193 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EA657E00A0C
	for <meta-ti@yoctoproject.org>; Wed, 17 Oct 2018 13:02:09 -0700 (PDT)
Received: by mail-pl1-f193.google.com with SMTP id p25-v6so13184973pli.11
	for <meta-ti@yoctoproject.org>; Wed, 17 Oct 2018 13:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=DsluG29zDAC5lkMUTecKVrcu2X2nuoTuY/qbGISdhiU=;
	b=W+P/vC8Mtd1ZaFw/oSsm50e8HrwgNXPSYjoWn1y5r2/4btgCRElyuTyCjptACe+VH2
	epMVO6YDnKfqquD1HDPo5dOAaHWB2XKlfzFxopF7IG2i2HO1nV4Ayav7F/W5E+3HtVzg
	N3aMgeE/8GpPtwYaw0FTIrouVEtw3Duhlagx5dWm3aeUXpKWz8XriBr6zMgvrf1604Pv
	kyBrFHvDxsF50wokhj6brGWMBU7egZBMKyH8vqQokhriovx+K2WMieR7tQ5+7u0igFqD
	kZInksuyyW5rfm1pwH+/Gl3Kj6a+WF/vXnEHUQPeCVizgxvPcAsVAUiswJbrJ3hiAG+9
	oxIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=DsluG29zDAC5lkMUTecKVrcu2X2nuoTuY/qbGISdhiU=;
	b=p9vK6YRx2LBQrfa8GSQbaiFwe4XnoTzmQHY3nnVGXnPDPDrFORMfM+gzBPAUPhQd5A
	QoERXZbAXy2q60Ndrs8RiKYFQXPQmyp0x/AlYVdlDEM+KdrtyRvqX2UPV5D8itRqlyGZ
	nnRhRXikaZg0JXmuJ9kBMqdQeAwUILEZ4GSC/jGjGHHNoUmYlHQ9mX4EtgWRguiKPPhd
	bD9+qe3KBx4jhB0jlwqnB5BYJksxcr4CDKi1+1hIzhBw3as6YZlN3iUTRQZfSFxj0zAc
	GH2dWG9xn/1jgduMYLXmMcvpYmxVkb+JxfpkYCHXqSoFA9czaF6c+NwJLlnT9spWPPI1
	VYFQ==
X-Gm-Message-State: ABuFfoiWH/lch1+c25o/f7oecIR1S722d2ZmFaYQ/0w/2jKORVfsiF/7
	1KZAwglFsSd0QlGuyNU5s4wQyCGQFNo=
X-Google-Smtp-Source: ACcGV62DMBN1m9KE206V12sNE4W8PBL4VzgyDeQXjohbrqbrLjP2D8c/pRVTAj4twRfJY28nGxf/+g==
X-Received: by 2002:a17:902:2867:: with SMTP id
	e94-v6mr14067139plb.317.1539806528824; 
	Wed, 17 Oct 2018 13:02:08 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::b111])
	by smtp.gmail.com with ESMTPSA id
	d197-v6sm26022777pga.1.2018.10.17.13.02.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Oct 2018 13:02:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@yoctoproject.org
Date: Wed, 17 Oct 2018 13:02:00 -0700
Message-Id: <20181017200200.2296-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [PATCH V2 4/5] beaglebone.conf: Package kernel and devicetree
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
X-List-Received-Date: Wed, 17 Oct 2018 20:02:10 -0000
Content-Transfer-Encoding: 8bit

Use variables from upstream u-boot, makes it easy to switch to
mainline u-boot from oe-core if someone wants to

Use SPL_BINARY and UBOOT_SUFFIX to define IMAGE_BOOT_FILES

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
V2: Use SPL_BINARY var

 conf/machine/beaglebone.conf | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/conf/machine/beaglebone.conf b/conf/machine/beaglebone.conf
index 25147926..36920673 100644
--- a/conf/machine/beaglebone.conf
+++ b/conf/machine/beaglebone.conf
@@ -1,6 +1,6 @@
 #@TYPE: Machine
 #@NAME: BeagleBone machine
-#@DESCRIPTION: Machine configuration for the http://beagleboard.org/bone board 
+#@DESCRIPTION: Machine configuration for the http://beagleboard.org/bone board
 
 require conf/machine/include/ti33x.inc
 
@@ -17,10 +17,16 @@ SERIAL_CONSOLE = "115200 ttyS0"
 #UBOOT_MACHINE = "am335x_boneblack_config"
 
 WKS_FILE = "sdimage-bootpart.wks"
-IMAGE_BOOT_FILES = "MLO u-boot.img"
-IMAGE_FSTYPES += "tar.xz wic.xz"
 
 do_image_wic[depends] += "mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot"
+IMAGE_BOOT_FILES ?= "u-boot.${UBOOT_SUFFIX} ${SPL_BINARY}"
+
+IMAGE_FSTYPES += "tar.xz wic.xz"
 
 # Refine the list of device targets for ti-pdk class recipes
 TI_PDK_LIMIT_BOARDS = "bbbAM335x"
+
+SPL_BINARY = "MLO"
+UBOOT_SUFFIX = "img"
+
+IMAGE_INSTALL_append = " kernel-devicetree kernel-image-zimage"
-- 
2.19.1


