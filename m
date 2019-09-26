Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F0F6AE0084E; Thu, 26 Sep 2019 11:46:16 -0700 (PDT)
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
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.210.194 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7FE30E0084E
	for <meta-ti@yoctoproject.org>; Thu, 26 Sep 2019 11:46:15 -0700 (PDT)
Received: by mail-pf1-f194.google.com with SMTP id q12so15058pff.9
	for <meta-ti@yoctoproject.org>; Thu, 26 Sep 2019 11:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=BmLyzAmLmznTjwc2LCTJQ1DfO3GzmgLV3aaHqJrAnQA=;
	b=cKgG/v8HAVdwgmc3xdeMv24QMzRCeNoKHGP19aYBODP/fS8RFAJNdAosTTarQgNVnY
	Q0+3jxSW7s1k1uyZEYlbovNpV7Fkz2w1CwzxNsW8iir9ZT1oWwIQ3gG+CSbMPYiXV+TY
	5Aaaax5WuYLRN/4Pz70QMPiEGuNcspnhe4KW7vK6UUd0A0w5Z9X6SNjyiDV7Gyx7JG+D
	9XvXQPNDrSy+z52W+VOmRfJoVILpvVA6lgNBSrC2QYrsRbKecUx7jpL5ZCLGc5cezROn
	F8Ffof8b4u/ZdGmQiSzLyRvgz2+j3JCm9NvTUrNV0pToAskAMYbgStSJEKPheGVInar6
	xb6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=BmLyzAmLmznTjwc2LCTJQ1DfO3GzmgLV3aaHqJrAnQA=;
	b=BAQabtFxSfN186cufiie9Q8Ugr2xbmZ5PjRI7Dx9z6sofeAeDhi7fnIwI/4wME6QNa
	IDlXgHQqJ+N6hLa4hE1Dz8ktrZnYvAZvA7ZKLQa7t0T9E636xEClVcOcrdXq/tEnVmo9
	uFEq6zVEwv5VTpEtAsbxCRObRo715vDlftKly00PWN8Hqeul4seLuMZSUZVwZ4oeBKFF
	03MCkw9IDaYgeIMalRsTVIbFN9jHowb0FvK3/HwfLgL0OuK8V/Od6XuLu10Ag+k/ftGS
	PnIWdkYH0iOAKoaGDOAkRxj77nHeHMScuAFzE8Er504YdjLbHa9ItKfK1RPdAihjZgjA
	eIsg==
X-Gm-Message-State: APjAAAWvTOUmRZaJm93ToM3xUYn9WlTBvRfp6uRAEU8mQc3/9d4hKpIt
	shaFyjdHaJkLZ4ywwv3FP1stZ9z+v2Q=
X-Google-Smtp-Source: APXvYqzpkNacQi5iT+kBzYBlQ8h5m694V/pQmWVYFn1zR1fX6Wk49H3ldoG1Fkdt6xh16L79kCbUww==
X-Received: by 2002:a17:90a:fe04:: with SMTP id
	ck4mr5300769pjb.74.1569523574391; 
	Thu, 26 Sep 2019 11:46:14 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3])
	by smtp.gmail.com with ESMTPSA id w7sm2713783pjn.1.2019.09.26.11.46.13
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 26 Sep 2019 11:46:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@yoctoproject.org
Date: Thu, 26 Sep 2019 11:46:06 -0700
Message-Id: <20190926184606.2517378-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH V3] rwmem: Update to 2.0-rc2+
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
X-List-Received-Date: Thu, 26 Sep 2019 18:46:17 -0000
Content-Transfer-Encoding: 8bit

- New versions uses CMake and extra modules
- Correct detection of nm/ranlib/ar for LTO
- Fix build with clang/libc++
- depend on python3, needed during build

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Move to latest upstream and drop upstreamed patches
v3: depend on python3

 recipes-bsp/rwmem/rwmem_1.1.bb | 13 -------------
 recipes-bsp/rwmem/rwmem_1.2.bb | 27 +++++++++++++++++++++++++++
 2 files changed, 27 insertions(+), 13 deletions(-)
 delete mode 100644 recipes-bsp/rwmem/rwmem_1.1.bb
 create mode 100644 recipes-bsp/rwmem/rwmem_1.2.bb

diff --git a/recipes-bsp/rwmem/rwmem_1.1.bb b/recipes-bsp/rwmem/rwmem_1.1.bb
deleted file mode 100644
index 2848e1cd..00000000
--- a/recipes-bsp/rwmem/rwmem_1.1.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-SUMMARY = "A small tool to read/write memory"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-
-SRCREV = "54904b8873b265d8f1faf82617c2f04814c102c6"
-SRC_URI = "git://github.com/tomba/rwmem.git"
-
-S = "${WORKDIR}/git"
-
-do_install() {
-	install -d ${D}${bindir}
-	install -m 0755 rwmem ${D}${bindir}
-}
diff --git a/recipes-bsp/rwmem/rwmem_1.2.bb b/recipes-bsp/rwmem/rwmem_1.2.bb
new file mode 100644
index 00000000..0545b0cc
--- /dev/null
+++ b/recipes-bsp/rwmem/rwmem_1.2.bb
@@ -0,0 +1,27 @@
+SUMMARY = "A small tool to read/write memory"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+DEPENDS += "python3"
+
+PV .= "+git${SRCPV}"
+
+SRCREV_rwmem = "cc296c5366a35a4c4271cfa3cc9831f6f34bfd9d"
+SRCREV_inih = "4b10c654051a86556dfdb634c891b6c3224c4109"
+SRCREV_pybind11 = "9a19306fbf30642ca331d0ec88e7da54a96860f9"
+
+SRCREV_FORMAT = "rwmem_inih_pybind11"
+
+SRC_URI = "git://github.com/tomba/rwmem.git;protocol=https;name=rwmem \
+           git://github.com/benhoyt/inih.git;protocol=https;name=inih;nobranch=1;destsuffix=git/ext/inih \
+           git://github.com/pybind/pybind11.git;protocol=https;name=pybind11;nobranch=1;destsuffix=git/ext/pybind11 \
+           "
+
+S = "${WORKDIR}/git"
+
+inherit cmake pkgconfig
+
+do_install() {
+	install -D -m 0755 ${B}/bin/rwmem ${D}${bindir}/rwmem
+	install -D -m 0644 ${B}/lib/librwmem.a ${D}${libdir}/librwmem.a
+}
-- 
2.23.0


