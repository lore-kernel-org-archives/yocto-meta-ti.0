Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id ADD2DE00CA2; Thu, 12 Oct 2017 14:14:28 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 349 seconds by postgrey-1.32 at yocto-www;
	Thu, 12 Oct 2017 14:14:25 PDT
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5BE1FE00CA2
	for <meta-ti@yoctoproject.org>; Thu, 12 Oct 2017 14:14:25 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 342E6204B1;
	Thu, 12 Oct 2017 21:08:36 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id VUqEgvvjnJ-f; Thu, 12 Oct 2017 21:08:36 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E011420B03;
	Thu, 12 Oct 2017 21:08:34 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 4AD5D1626EF;
	Thu, 12 Oct 2017 17:08:34 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Thu, 12 Oct 2017 17:08:28 -0400
Message-Id: <1507842509-789-4-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1507842509-789-1-git-send-email-denis@denix.org>
References: <1507842509-789-1-git-send-email-denis@denix.org>
Subject: [master][PATCH 4/5] FIXME: gdbc6x: bypass new gcc7 checks, RDEPENDS on bash
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
X-List-Received-Date: Thu, 12 Oct 2017 21:14:28 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-devtools/gdbc6x/gdbc6x_git.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/recipes-devtools/gdbc6x/gdbc6x_git.bb b/recipes-devtools/gdbc6x/gdbc6x_git.bb
index 0e6a907..df8175b 100644
--- a/recipes-devtools/gdbc6x/gdbc6x_git.bb
+++ b/recipes-devtools/gdbc6x/gdbc6x_git.bb
@@ -16,6 +16,8 @@ S = "${WORKDIR}/git/gdbc6x"
 inherit update-rc.d
 inherit gettext
 
+CFLAGS += "-Wimplicit-fallthrough=0 -Wformat-overflow=0 -Wformat-truncation=0"
+
 do_configure () {
     cd ${S}
     ./configure --program-suffix=c6x --target=tic6x-elf-tirtos --host=${HOST_SYS} --prefix=${S}/install_gdb
@@ -34,7 +36,7 @@ do_install () {
     install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/gdbserverproxy
 }
 
-RDEPENDS_${PN} = "gdbserverproxy-module-drv"
+RDEPENDS_${PN} = "gdbserverproxy-module-drv bash"
 
 include gdbc6x.inc
 
-- 
2.7.4


