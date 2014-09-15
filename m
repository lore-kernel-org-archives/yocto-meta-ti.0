Return-Path: <Liviu.Gheorghisan@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B52DDE0084A; Mon, 15 Sep 2014 00:23:05 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=no
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id B31ABE00746
	for <meta-ti@yoctoproject.org>; Mon, 15 Sep 2014 00:23:00 -0700 (PDT)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.158.1;
	Mon, 15 Sep 2014 09:22:58 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4496)	id 3B57E28D5E0;
	Mon, 15 Sep 2014 09:22:58 +0200 (CEST)
From: Liviu Gheorghisan <liviu.gheorghisan@enea.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 15 Sep 2014 09:22:56 +0200
Message-ID: <1410765776-37708-1-git-send-email-liviu.gheorghisan@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: liviu.gheorghisan@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH 1/1] CVE-2014-5077 Kernel/SCTP: fix a NULL pointer dereference
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
X-List-Received-Date: Mon, 15 Sep 2014 07:23:05 -0000
Content-Type: text/plain

A NULL pointer dereference flaw was found in the way the
Linux kernel's Stream Control Transmission Protocol
(SCTP) implementation handled simultaneous connections
between the same hosts. A remote attacker could use this
flaw to crash the system.

References:
    - https://access.redhat.com/security/cve/CVE-2014-5077
    - http://patchwork.ozlabs.org/patch/372475/

Signed-off-by: Liviu Gheorghisan <liviu.gheorghisan@enea.com>
---
 ...p-inherit-auth-capable-on-INIT-collisions.patch | 33 ++++++++++++++++++++++
 recipes-kernel/linux/linux-keystone_3.10.bb        |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 recipes-kernel/linux/files/Fix-CVE-2014-5077-sctp-inherit-auth-capable-on-INIT-collisions.patch

diff --git a/recipes-kernel/linux/files/Fix-CVE-2014-5077-sctp-inherit-auth-capable-on-INIT-collisions.patch b/recipes-kernel/linux/files/Fix-CVE-2014-5077-sctp-inherit-auth-capable-on-INIT-collisions.patch
new file mode 100644
index 0000000..f196d24
--- /dev/null
+++ b/recipes-kernel/linux/files/Fix-CVE-2014-5077-sctp-inherit-auth-capable-on-INIT-collisions.patch
@@ -0,0 +1,33 @@
+CVE-2014-5077 Kernel/SCTP: fix a NULL pointer dereference
+
+A NULL pointer dereference flaw was found in the way the 
+Linux kernel's Stream Control Transmission Protocol 
+(SCTP) implementation handled simultaneous connections 
+between the same hosts. A remote attacker could use this 
+flaw to crash the system.
+
+References:
+    - https://access.redhat.com/security/cve/CVE-2014-5077
+    - http://patchwork.ozlabs.org/patch/372475/
+
+Upstream-Status: Backport
+
+Fixes: 730fc3d05cd4 ("[SCTP]: Implete SCTP-AUTH parameter processing")
+Reported-by: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
+Signed-off-by: Daniel Borkmann <dborkman@redhat.com>
+Signed-off-by: Liviu Gheorghisan <liviu.gheorghisan@enea.com>
+Tested-by: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
+Cc: Vlad Yasevich <vyasevich@gmail.com>
+---
+diff --git a/net/sctp/associola.c b/net/sctp/associola.c
+index cef5099..c2d5109 100644
+--- a/net/sctp/associola.c
++++ b/net/sctp/associola.c
+@@ -1198,6 +1198,7 @@ void sctp_assoc_update(struct sctp_association *asoc,
+ 	asoc->c = new->c;
+ 	asoc->peer.rwnd = new->peer.rwnd;
+ 	asoc->peer.sack_needed = new->peer.sack_needed;
++	asoc->peer.auth_capable = new->peer.auth_capable;
+ 	asoc->peer.i = new->peer.i;
+ 	sctp_tsnmap_init(&asoc->peer.tsn_map, SCTP_TSN_MAP_INITIAL,
+ 			 asoc->peer.i.initial_tsn, GFP_ATOMIC);
diff --git a/recipes-kernel/linux/linux-keystone_3.10.bb b/recipes-kernel/linux/linux-keystone_3.10.bb
index a90ae47..e2ab8a6 100644
--- a/recipes-kernel/linux/linux-keystone_3.10.bb
+++ b/recipes-kernel/linux/linux-keystone_3.10.bb
@@ -31,6 +31,7 @@ SRC_URI = "git://git.ti.com/keystone-linux/linux.git;protocol=git;branch=${BRANC
            file://Fix_HRTICK_related_deadlock_from_ntp_lock.patch\
            file://dts-for-m800.patch\
            file://Fix-CVE-2014-2309-dont-set-DST_NOCOUNT-for-remotely.patch\
+           file://Fix-CVE-2014-5077-sctp-inherit-auth-capable-on-INIT-collisions.patch\
            "
 
 S = "${WORKDIR}/git"
-- 
1.9.1


