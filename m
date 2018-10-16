Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 13092E00B6C; Tue, 16 Oct 2018 00:47:56 -0700 (PDT)
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
	*      [209.85.214.195 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F2F80E00AD1
	for <meta-ti@yoctoproject.org>; Tue, 16 Oct 2018 00:47:54 -0700 (PDT)
Received: by mail-pl1-f195.google.com with SMTP id 1-v6so10586526plv.7
	for <meta-ti@yoctoproject.org>; Tue, 16 Oct 2018 00:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=zMXKgYd11M4CcynRoS1fV5vnv1VlkSBum7e9RkGVEfE=;
	b=Z8kTJigle1VPC6whG8Ynjo5jsawVJ5vIji2zcG/Raa9hDKjuHGsB5yTvocoo5dwgFF
	aVceY/hDDqsNJGLrlBH9DGSusuy+9nybZqiS8chKMTFZ7CW/KXmKljWhy0n6KeXU1Isz
	SSpeMU6hkiME5v6xbgqBTdv5SoP0qseNKXDVFXNj+3aBBWko+DNC7BKVqzT3uHzj00O6
	uhdo1WKEVKTeBHWdvpBb9X5wih9eZ40r7bW76O8rQp2zjPj4uaVM8gd85cwOgbxJxg1+
	U9sO00hSF9odWQj/3Lzt63Tcy6DoFgpISDY1F7+p5A+HBki54V/kG+8kwZCWG2d+90Mb
	ReXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=zMXKgYd11M4CcynRoS1fV5vnv1VlkSBum7e9RkGVEfE=;
	b=rGXkaU4+p5vN7VSG/qgOh0uKw6AtNtDWSgNPR8hATTOGNVX6eKWkRqCeQFY41UDFjk
	Q/cGfYwhTOCaj74dxxGVgpAosTvz1HzldngfWMAMrzgg3IIG1V/Nznfu4hBT0/SxtL+o
	Q0/AZqb0i2Yy10AS36D0nsB/VA7nKjWs/WJn/MujPituFPRPTTAL0s+op8EV7UEvy6HZ
	WM9qoQrQ31jYJjc3wG7mq5BGYvvYOfjdlcBrLMVYuylyGBLm+SntC48wvdopnDQY4ogf
	f3rm804pu3koGOV777i1RceM+YptwAERoRTlhgurID6xfr2NOXOWHR3UoIRrhQFZoTIu
	ctCg==
X-Gm-Message-State: ABuFfojGqiXDfDirBKvtIrzN735FSee+uUAhN72b5ESDHac11PJrFVza
	a+pxlhXMqOinldkDLLxeV/PuGKJA
X-Google-Smtp-Source: ACcGV60swLdyArXx+d8fdLvqfmx6TKLEqMYFUhuDcRghLfxh+z9J2sNu5Ex5QOOW29TWFNVlkLyymA==
X-Received: by 2002:a17:902:40d:: with SMTP id
	13-v6mr20489020ple.257.1539676074049; 
	Tue, 16 Oct 2018 00:47:54 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::b111])
	by smtp.gmail.com with ESMTPSA id
	r65-v6sm17887282pfj.5.2018.10.16.00.47.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Oct 2018 00:47:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@yoctoproject.org
Date: Tue, 16 Oct 2018 00:47:44 -0700
Message-Id: <20181016074745.39972-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181016074745.39972-1-raj.khem@gmail.com>
References: <20181016074745.39972-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] beaglebone.wks: Add beaglebone wic template
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
X-List-Received-Date: Tue, 16 Oct 2018 07:47:56 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 wic/beaglebone.wks | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 wic/beaglebone.wks

diff --git a/wic/beaglebone.wks b/wic/beaglebone.wks
new file mode 100644
index 00000000..b75f238d
--- /dev/null
+++ b/wic/beaglebone.wks
@@ -0,0 +1,6 @@
+# short-description: Create SD card image for Beaglebone
+# long-description: Creates a partitioned SD card image for Beaglebone.
+# Boot files are located in the first vfat partition.
+
+part /boot --source bootimg-partition --ondisk mmcblk0 --fstype=vfat --label boot --active --align 4 --size 16 --sourceparams="loader=u-boot" --use-uuid
+part / --source rootfs --ondisk mmcblk --fstype=ext4 --label root --align 4 --use-uuid
-- 
2.19.1


