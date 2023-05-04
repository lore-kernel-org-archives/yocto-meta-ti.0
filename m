Return-Path: <d.schultz@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A310CC77B78
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 12:51:36 +0000 (UTC)
Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
 by mx.groups.io with SMTP id smtpd.web11.48507.1683204685547530475
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 04 May 2023 05:51:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@phytec.de header.s=a4 header.b=WoPa4d2Q;
 spf=pass (domain: phytec.de, ip: 91.26.50.163, mailfrom: d.schultz@phytec.de)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
	q=dns/txt; i=@phytec.de; t=1683204683; x=1685796683;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=afNfqEl18NZ+9NrDfwy239h/GtrnTaUSEK1JyOC78UU=;
	b=WoPa4d2QpwlQpDetJsktT403GA6muSKzSRmSjMl0vOCqRcYoeWKz+elo38g76D3M
	djKFoiMff37ln1KvF+RKVDhyV5IMaj7Lfj+IIjpbV015WX4g8oAJICExjhtbGJxl
	+ySWYODlOsBRpfzBnVVnyp9yTX/TK+CpnQ9NtISNUso=;
X-AuditID: ac14000a-917fe70000007ecb-76-6453aa4b32a5
Received: from berlix.phytec.de (Unknown_Domain [172.25.0.12])
	(using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 64.1D.32459.B4AA3546; Thu,  4 May 2023 14:51:23 +0200 (CEST)
Received: from ls-radium.phytec (172.25.0.11) by Berlix.phytec.de
 (172.25.0.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 4 May
 2023 14:51:22 +0200
From: Daniel Schultz <d.schultz@phytec.de>
To: <meta-ti@lists.yoctoproject.org>
CC: Daniel Schultz <d.schultz@phytec.de>
Subject: [kirkstone 2/2] recipes-graphics: ti-img-rogue-umlibs: Make -vulkan optional
Date: Thu, 4 May 2023 05:51:07 -0700
Message-ID: <20230504125107.1785647-2-d.schultz@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230504125107.1785647-1-d.schultz@phytec.de>
References: <20230504125107.1785647-1-d.schultz@phytec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.0.11]
X-ClientProxiedBy: Florix.phytec.de (172.25.0.13) To Berlix.phytec.de
 (172.25.0.12)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrALMWRmVeSWpSXmKPExsWyRpKBR9d7VXCKwef/ehZzv9xic2D0mHnq
	EXMAYxSXTUpqTmZZapG+XQJXxplji5kKjvFWnDz9mamBcTF3FyMnh4SAicTL9tUsXYxcHEIC
	S5gkNiw8zQKSEBK4zyixdj4PiM0moCVxZ8tcZhBbREBFYuK2eaxdjBwczAIaEu3PmEDCwgKh
	Eu+mPwCzWYBKGr6eBSvnFbCS+HB1HwvELnmJmZe+s4PYnALWEm/WXmSEWGUlMeH0PyaIekGJ
	kzOfgNUzA9U3b53NDGFLSBx88YIZol5BYva2yYwwM6ede80MYYdKHNm0mmkCo9AsJKNmIRk1
	C8moBYzMqxiFcjOTs1OLMrP1CjIqS1KT9VJSNzGCQlWEgWsHY98cj0OMTByMhxglOJiVRHg/
	FPqlCPGmJFZWpRblxxeV5qQWH2KU5mBREue938OUKCSQnliSmp2aWpBaBJNl4uCUamCc9yan
	yDZp48n/3EKrYlPsWRiaa+y7RB94dHIvmfvqUk1ywelpnaeyPIyMOgxW7OzT3vHZ0IrhXNLG
	hV1s0gZZJunflU9Uvf9RahzHJq7/rnjthNdHJO4qT777Zbb2v62CvC+FlbJm6V++cN6w7M3L
	Q93rV1/Z1HXclXdSF9ft85nKDf4eFq+UWIozEg21mIuKEwHFbUc+QwIAAA==
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 04 May 2023 12:51:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16484

Only include the ti-img-rogue-umlibs-vulkan package if the
DISTRO_FEATURES x11 is enabled. Right now, this recipe has a failed
build dependency on images without x11.

Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
---
 .../libgles/ti-img-rogue-umlibs_23.1.6404501.bb   | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_23.1.6404501.bb b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_23.1.6404501.bb
index c33f8ae0..a6ed57f4 100644
--- a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_23.1.6404501.bb
+++ b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_23.1.6404501.bb
@@ -29,10 +29,18 @@ do_install:append() {
         mv ${D}/lib/firmware ${D}${nonarch_base_libdir}
         rmdir ${D}/lib
     fi
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'false', 'true', d)}; then
+        rm -rf ${D}${libdir}/libVK_IMG.so*
+    fi 
     rm -rf "${D}/etc/init.d"
 }
 
-PACKAGES = "${PN}-vulkan ${PN}-tools ${PN}-firmware ${PN}"
+PACKAGES = " \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "${PN}-vulkan", "", d)} \
+    ${PN}-tools \
+    ${PN}-firmware \
+    ${PN} \
+"
 
 FILES:${PN}-vulkan = " \
     ${datadir}/vulkan \
@@ -56,7 +64,10 @@ RDEPENDS:${PN}-tools = "python3-core"
 FILES:${PN}-firmware = "${base_libdir}/firmware/*"
 INSANE_SKIP:${PN}-firmware += "arch"
 
-RRECOMMENDS:${PN} += "${PN}-vulkan ${PN}-tools"
+RRECOMMENDS:${PN} += " \
+    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "${PN}-vulkan", "", d)} \
+    ${PN}-tools \
+"
 RDEPENDS:${PN} += " ${PN}-firmware"
 
 INSANE_SKIP:${PN} += "already-stripped dev-so"
-- 
2.25.1


