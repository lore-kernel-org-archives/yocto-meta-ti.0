Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.24620.1617408631831735137
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 02 Apr 2021 17:10:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4533640C99;
	Sat,  3 Apr 2021 00:10:31 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VuOs2odLQKq2; Sat,  3 Apr 2021 00:10:31 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2D93D40A77;
	Sat,  3 Apr 2021 00:10:30 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 0062E17457D;
	Fri,  2 Apr 2021 20:10:28 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 05/11] gdbc6x: suppress gcc10 multiple definitions of *_varobj_ops
Date: Fri,  2 Apr 2021 20:09:57 -0400
Message-Id: <1617408603-2482-6-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617408603-2482-1-git-send-email-denis@denix.org>
References: <1617408603-2482-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@konsulko.com>

Workaround for the following gcc10 errors:
.../gdbc6x/gdb/varobj.h:221: multiple definition of `ada_varobj_ops'; mi-cmd-var.o:.../gdbc6x/gdb/./varobj.h:221: first defined here
.../gdbc6x/gdb/varobj.h:220: multiple definition of `java_varobj_ops'; mi-cmd-var.o:.../gdbc6x/gdb/./varobj.h:220: first defined here
.../gdbc6x/gdb/varobj.h:219: multiple definition of `cplus_varobj_ops'; mi-cmd-var.o:.../gdbc6x/gdb/./varobj.h:219: first defined here
.../gdbc6x/gdb/varobj.h:218: multiple definition of `c_varobj_ops'; mi-cmd-var.o:.../gdbc6x/gdb/./varobj.h:218: first defined here

Needs to be resolved properly in the code later:
https://gcc.gnu.org/gcc-10/porting_to.html

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 recipes-devtools/gdbc6x/gdbc6x_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-devtools/gdbc6x/gdbc6x_git.bb b/recipes-devtools/gdbc6x/gdbc6x_git.bb
index 2d2f6c1..aa519a9 100644
--- a/recipes-devtools/gdbc6x/gdbc6x_git.bb
+++ b/recipes-devtools/gdbc6x/gdbc6x_git.bb
@@ -19,6 +19,8 @@ S = "${WORKDIR}/git/gdbc6x"
 inherit update-rc.d
 inherit gettext
 
+CFLAGS += "-fcommon"
+
 do_configure () {
     cd ${S}
     ./configure --program-suffix=c6x --target=tic6x-elf-tirtos --host=${HOST_SYS} --prefix=${S}/install_gdb
-- 
2.7.4

