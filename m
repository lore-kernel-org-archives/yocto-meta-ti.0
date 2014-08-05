Return-Path: <sona.sarmadi@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 16EDCE00799; Tue,  5 Aug 2014 05:25:25 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id EA661E004DD
	for <meta-ti@yoctoproject.org>; Tue,  5 Aug 2014 05:25:13 -0700 (PDT)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.158.1; Tue, 5 Aug 2014
	14:25:10 +0200
Received: by sestofb10.enea.se (Postfix, from userid 2671)	id 1AAB1288F36;
	Tue,  5 Aug 2014 14:25:11 +0200 (CEST)
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 5 Aug 2014 14:25:05 +0200
Message-ID: <1407241505-27786-1-git-send-email-sona.sarmadi@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: sona.sarmadi@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH] linux-keystone: Fix CVE-2014-2309
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
X-List-Received-Date: Tue, 05 Aug 2014 12:25:25 -0000
Content-Type: text/plain

Fix for CVE-2014-2309 - don't set DST_NOCOUNT for remotely added routes.

Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
---
 ...14-2309-dont-set-DST_NOCOUNT-for-remotely.patch | 36 ++++++++++++++++++++++
 recipes-kernel/linux/linux-keystone_3.10.bb        |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 recipes-kernel/linux/files/Fix-CVE-2014-2309-dont-set-DST_NOCOUNT-for-remotely.patch

diff --git a/recipes-kernel/linux/files/Fix-CVE-2014-2309-dont-set-DST_NOCOUNT-for-remotely.patch b/recipes-kernel/linux/files/Fix-CVE-2014-2309-dont-set-DST_NOCOUNT-for-remotely.patch
new file mode 100644
index 0000000..044e2e1
--- /dev/null
+++ b/recipes-kernel/linux/files/Fix-CVE-2014-2309-dont-set-DST_NOCOUNT-for-remotely.patch
@@ -0,0 +1,36 @@
+From b3da7f60d51cebeecde61349e0f9a7c319293317 Mon Sep 17 00:00:00 2001
+From: Sabrina Dubroca <sd@queasysnail.net>
+Date: Thu, 6 Mar 2014 17:51:57 +0100
+Subject: [PATCH] ipv6: don't set DST_NOCOUNT for remotely added routes
+
+DST_NOCOUNT should only be used if an authorized user adds routes
+locally. In case of routes which are added on behalf of router
+advertisments this flag must not get used as it allows an unlimited
+number of routes getting added remotely.
+
+Upstream-Status: Backport
+
+Signed-off-by: Sabrina Dubroca <sd@queasysnail.net>
+Acked-by: Hannes Frederic Sowa <hannes@stressinduktion.org>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+---
+ net/ipv6/route.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/net/ipv6/route.c b/net/ipv6/route.c
+index bacce6c..b68500a 100644
+--- a/net/ipv6/route.c
++++ b/net/ipv6/route.c
+@@ -1399,7 +1399,7 @@ int ip6_route_add(struct fib6_config *cfg)
+ 	if (!table)
+ 		goto out;
+ 
+-	rt = ip6_dst_alloc(net, NULL, DST_NOCOUNT, table);
++	rt = ip6_dst_alloc(net, NULL, (cfg->fc_flags & RTF_ADDRCONF) ? 0 : DST_NOCOUNT, table);
+ 
+ 	if (!rt) {
+ 		err = -ENOMEM;
+-- 
+1.9.1
+
diff --git a/recipes-kernel/linux/linux-keystone_3.10.bb b/recipes-kernel/linux/linux-keystone_3.10.bb
index e90c9fc..0e9e12a 100644
--- a/recipes-kernel/linux/linux-keystone_3.10.bb
+++ b/recipes-kernel/linux/linux-keystone_3.10.bb
@@ -26,6 +26,7 @@ PV = "3.10.10"
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/keystone-linux/linux.git;protocol=git;branch=${BRANCH}\
            file://defconfig\
+           file://Fix-CVE-2014-2309-dont-set-DST_NOCOUNT-for-remotely.patch\
            "
 
 S = "${WORKDIR}/git"
-- 
1.9.1


