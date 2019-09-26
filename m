Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C327DE00C9B; Thu, 26 Sep 2019 11:26:46 -0700 (PDT)
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
	*      [209.85.215.196 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 56C0DE0098A
	for <meta-ti@yoctoproject.org>; Thu, 26 Sep 2019 11:26:45 -0700 (PDT)
Received: by mail-pg1-f196.google.com with SMTP id x10so2003949pgi.5
	for <meta-ti@yoctoproject.org>; Thu, 26 Sep 2019 11:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Y6OzK0ICNi8CeHt8D4nbVLNuTYGNt0FQCryyKRyo+bg=;
	b=fGa+2av3GRtLRsAcqBlXX8FRIUfa7o4gTdBrbwFRdHOgnqjj5EgNGC8S2AawzKT8pP
	RipS/xllBUMFOA/TB5/xsna1k4bjxzpkuVSfDVNddCqbQR0KEOJfqH3k6ZUXiFc6g1EC
	AmIkOV2cPok5Ol58TDNfPNi4JMEt60P6XvoYLEqrtnsq6ITzVo5WddeE/phiyh8Uql7s
	3lnTJce5PavXjuvs8eUdzqBKT/352aLbp3Dbn37ylfpYRhs86W4FSSK+6Gkclb+b/v8Z
	Qx7vmJfDhq0Ts25C5zqw8WzMmMUceqfd2BWDFN5UAv3AF298eyLSjCDMPw0JLcniXde0
	/Ppg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Y6OzK0ICNi8CeHt8D4nbVLNuTYGNt0FQCryyKRyo+bg=;
	b=lIpT9A9ySD7r045P95GRANnIj9e+VV2psj0RURp8FWsC0eqcWcaGRoNA/2FGVK/Frc
	ZNa/Jgod57JyJFYL7wOm0xAYHuSVPR7hmWvPyogOVYHb/6WedaxekuWdxcAn0AOexnNz
	frjaLBM5XDP4G4uNEvCb05gsgpgpXiTPkcYHN9blTGIWDC65NhzJo9vNdnNw8brbEHPz
	NtGIjLjSMEYAtR7/mqenBuQkvw7dqlW5wUuo7jTtGzIXfxUGyI3O/OHDWg5DJsPoVo+S
	9LO5w5GKx9hqCxNYNaUB6rTKrkTFXd7U9IosspC0NpDZs8OvmPmoJ8ZSWy7/mklLl5wf
	48/Q==
X-Gm-Message-State: APjAAAXylHG3AQP+XtMrSqEnbXgNWsAFATMRYYWqsKxZRtODlGNoYKqn
	HqivmQSI2H4O/c2uUDBCPx+/8GfYTgY=
X-Google-Smtp-Source: APXvYqxaPzrz7v6JqCYp8Lpy4SGI0eIcNYh9BR+dcb8/ma5PzXfXpInQR7oV0dnFuCOwb1vSbHxvaA==
X-Received: by 2002:a17:90a:8c15:: with SMTP id
	a21mr4919526pjo.99.1569522404137; 
	Thu, 26 Sep 2019 11:26:44 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3])
	by smtp.gmail.com with ESMTPSA id f3sm2541240pgj.62.2019.09.26.11.26.43
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 26 Sep 2019 11:26:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@yoctoproject.org
Date: Thu, 26 Sep 2019 11:26:35 -0700
Message-Id: <20190926182635.2515487-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH V2] rwmem: Update to 2.0-rc2+
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
X-List-Received-Date: Thu, 26 Sep 2019 18:26:46 -0000
Content-Transfer-Encoding: 8bit

- New versions uses CMake and extra modules
- Correct detection of nm/ranlib/ar for LTO
- Fix build with clang/libc++

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Move to latest upstream and drop upstreamed patches

 recipes-bsp/rwmem/rwmem_1.1.bb | 13 -------------
 recipes-bsp/rwmem/rwmem_1.2.bb | 25 +++++++++++++++++++++++++
 2 files changed, 25 insertions(+), 13 deletions(-)
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
index 00000000..7bd71da9
--- /dev/null
+++ b/recipes-bsp/rwmem/rwmem_1.2.bb
@@ -0,0 +1,25 @@
+SUMMARY = "A small tool to read/write memory"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
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
+inherit cmake pkgconfig python3native
+
+do_install() {
+	install -D -m 0755 ${B}/bin/rwmem ${D}${bindir}/rwmem
+	install -D -m 0644 ${B}/lib/librwmem.a ${D}${libdir}/librwmem.a
+}
-- 
2.23.0


