Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by mx.groups.io with SMTP id smtpd.web10.6547.1642164749389589487
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 14 Jan 2022 04:52:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@tq-group.com header.s=key1 header.b=NB+kr1SO;
 spf=pass (domain: ew.tq-group.com, ip: 93.104.207.81, mailfrom: matthias.schiffer@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1642164749; x=1673700749;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=moUA5WYL3oooplRfKWmvSh2UdUzMILnc5JapFD1cSlc=;
  b=NB+kr1SOZdUr8B8ppSqEZ0A6VcT7ckElnLvI4YFG+rWIOrrHqacWHBWt
   vb/dkR2vM/kqcnWqiJqjvzP1baxpVDa/FeBLKtK1swoc79kNLZB95X52f
   44HOmVeB+pGLaSjD5i47Uqa2i49YwoDV+m6MhrHst7sMTsAp4BKVIXypF
   yuNmbOOOsapHI9XChdYaAd3K3jCjx5nvejoo6LCOGtDUecdiRdlncsHqp
   f+KvDNjCtaGZIQVJhq0pzplviK13S8YNJBBybG5BnipnwQR4UgMfE7p0C
   FbIY4S2r1KJng3QWX/LA3XOmeOJ8WmNH9XzSEvNAsrU6/aTKnDtYxQBOU
   g==;
X-IronPort-AV: E=Sophos;i="5.88,288,1635199200"; 
   d="scan'208";a="21507857"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 14 Jan 2022 13:52:26 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 14 Jan 2022 13:52:26 +0100
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Fri, 14 Jan 2022 13:52:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1642164746; x=1673700746;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=moUA5WYL3oooplRfKWmvSh2UdUzMILnc5JapFD1cSlc=;
  b=gYpfM3lJwu88ZyxsEI29KRhRccnLECo4QrzDqDM+zAbiaDjPtxni8/LT
   v3yrBaJDwJ11McRNlU5R2Y3SYZqHRWyR7U0yS0MiZOhrhAGnRYKnYXwM8
   tYxbcaoFwCj3xOQ91MbHfoDS9f/XTPG1GDCdkpEzzxFFBCi4AdZ8uCj4Y
   1BkJO6qIQ8zm8YWy3JeUSPniyeCy4VisY8ds0omXpYLOrK1/FQPEMNiQU
   IaaSHCrxzT5qtQczcGRzWI9P8ZKbZQ0HcZ1NTNTX82M3OnzZwCndevzRj
   GQeug72Omv1D0VKXeDl4T2VxSogUVldg2S/TPFa21V57+qkER7ZJ973Xr
   A==;
X-IronPort-AV: E=Sophos;i="5.88,288,1635199200"; 
   d="scan'208";a="21507856"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 14 Jan 2022 13:52:26 +0100
Received: from localhost.localdomain (SCHIFFERM-M2.tq-net.de [10.121.201.138])
	by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 7973E280065;
	Fri, 14 Jan 2022 13:52:26 +0100 (CET)
From: "Matthias Schiffer" <matthias.schiffer@ew.tq-group.com>
To: meta-ti@lists.yoctoproject.org
Cc: Michael.Krummsdorf@tq-group.com,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH] ti-sgx-ddk-um: avoid unnecessary dependency on -dev package
Date: Fri, 14 Jan 2022 13:52:18 +0100
Message-Id: <20220114125218.3065949-1-matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ti-sgx-ddk-um's do_install creates a symlink libGLESv2.so.1 to
libGLESv2.so. As this symlink will be installed to ti-sgx-ddk-um, but
its target libGLESv2.so is in ti-sgx-ddk-um-dev, the automated
dependency analysis will add ti-sgx-ddk-um-dev to ti-sgx-ddk-um's
RDEPENDS. This will pull in a large number of other -dev packages
through RDEPENDS and RRECOMMENDS in turn.

Avoid this by having libGLESv2.so.1 point to libGLESv2.so.2 instead of
libGLESv2.so, so the symlink's target is in ti-sgx-ddk-um as well.

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---
 recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
index 9d55122c..e4243a2b 100644
--- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
+++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
@@ -56,7 +56,7 @@ S = "${WORKDIR}/git"
 
 do_install () {
     oe_runmake install DESTDIR=${D} TARGET_PRODUCT=${TARGET_PRODUCT}
-    ln -sf libGLESv2.so ${D}${libdir}/libGLESv2.so.1
+    ln -sf libGLESv2.so.2 ${D}${libdir}/libGLESv2.so.1
 
     chown -R root:root ${D}
 }
-- 
2.25.1

