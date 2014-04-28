Return-Path: <sona.sarmadi@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 95AE6E00BDA
	for <meta-ti@yoctoproject.org>; Mon, 28 Apr 2014 02:01:07 -0700 (PDT)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.158.1;
	Mon, 28 Apr 2014 11:01:05 +0200
Received: by sestofb10.enea.se (Postfix, from userid 2671)	id 24A0E28C882;
	Mon, 28 Apr 2014 11:01:06 +0200 (CEST)
From: <sona.sarmadi@enea.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 28 Apr 2014 11:01:04 +0200
Message-ID: <1398675664-27641-1-git-send-email-sona.sarmadi@enea.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: sona.sarmadi@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH] net: fib: fib6_add: fix potential NULL pointer dereference
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
X-List-Received-Date: Mon, 28 Apr 2014 09:01:10 -0000
Content-Type: text/plain

From: Sona Sarmadi <sona.sarmadi@enea.com>

 Fix for CVE-2013-6431

Upstream-Status: Backport
Reference: https://bugzilla.redhat.com/show_bug.cgi?id=1039054

Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
---
 .../linux/files/fix_for_CVE-2013-6431.patch        |   52 ++++++++++++++++++++
 recipes-kernel/linux/linux-keystone_3.10.bb        |    1 +
 2 files changed, 53 insertions(+)
 create mode 100644 recipes-kernel/linux/files/fix_for_CVE-2013-6431.patch

diff --git a/recipes-kernel/linux/files/fix_for_CVE-2013-6431.patch b/recipes-kernel/linux/files/fix_for_CVE-2013-6431.patch
new file mode 100644
index 0000000..abd4430
--- /dev/null
+++ b/recipes-kernel/linux/files/fix_for_CVE-2013-6431.patch
@@ -0,0 +1,52 @@
+From c5c56513b779cb082d05f63c606bde9321d395fb Mon Sep 17 00:00:00 2001
+From: Sona Sarmadi <sona.sarmadi@enea.com>
+Date: Tue, 22 Apr 2014 13:52:58 +0200
+Subject: [PATCH] net: fib: fib6_add: fix potential NULL pointer dereference
+
+When the kernel is compiled with CONFIG_IPV6_SUBTREES, and we return
+with an error in fn = fib6_add_1(), then error codes are encoded into
+the return pointer e.g. ERR_PTR(-ENOENT). In such an error case, we
+write the error code into err and jump to out, hence enter the if(err)
+condition. Now, if CONFIG_IPV6_SUBTREES is enabled, we check for:
+if (pn != fn && pn->leaf == rt)
+...
+if (pn != fn && !pn->leaf && !(pn->fn_flags & RTN_RTINFO))
+...
+Since pn is NULL and fn is f.e. ERR_PTR(-ENOENT), then pn != fn
+evaluates to true and causes a NULL-pointer dereference on further
+checks on pn. Fix it, by setting both NULL in error case, so that
+pn != fn already evaluates to false and no further dereference
+takes place.
+
+This was first correctly implemented in 4a287eba2 ("IPv6 routing,
+NLM_F_* flag support: REPLACE and EXCL flags support, warn about
+missing CREATE flag"), but the bug got later on introduced by
+188c517a0 ("ipv6: return errno pointers consistently for fib6_add_1()").
+
+Signed-off-by: Daniel Borkmann <dborkman@redhat.com>
+Cc: Lin Ming <mlin@ss.pku.edu.cn>
+Cc: Matti Vaittinen <matti.vaittinen@nsn.com>
+Cc: Hannes Frederic Sowa <hannes@stressinduktion.org>
+Acked-by: Hannes Frederic Sowa <hannes@stressinduktion.org>
+Acked-by: Matti Vaittinen <matti.vaittinen@nsn.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+---
+ net/ipv6/ip6_fib.c |    1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/net/ipv6/ip6_fib.c b/net/ipv6/ip6_fib.c
+index 5fc9c7a..45562f6 100644
+--- a/net/ipv6/ip6_fib.c
++++ b/net/ipv6/ip6_fib.c
+@@ -828,6 +828,7 @@ int fib6_add(struct fib6_node *root, struct rt6_info *rt, struct nl_info *info)
+ 
+ 	if (IS_ERR(fn)) {
+ 		err = PTR_ERR(fn);
++                fn = NULL;
+ 		goto out;
+ 	}
+ 
+-- 
+1.7.10.4
+
diff --git a/recipes-kernel/linux/linux-keystone_3.10.bb b/recipes-kernel/linux/linux-keystone_3.10.bb
index d97520a..587c6f6 100644
--- a/recipes-kernel/linux/linux-keystone_3.10.bb
+++ b/recipes-kernel/linux/linux-keystone_3.10.bb
@@ -24,6 +24,7 @@ PV = "3.10.10"
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/keystone-linux/linux.git;protocol=git;branch=${BRANCH}\
            file://defconfig\
+           file://fix_for_CVE-2013-6431.patch\
            "
 
 S = "${WORKDIR}/git"
-- 
1.7.10.4


