Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ww0-f51.google.com (mail-ww0-f51.google.com [74.125.82.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6AE8DE013A3
	for <meta-ti@lists.yoctoproject.org>;
	Sat,  3 Mar 2012 02:53:20 -0800 (PST)
Received: by wgbed3 with SMTP id ed3so1868455wgb.8
	for <meta-ti@lists.yoctoproject.org>;
	Sat, 03 Mar 2012 02:53:19 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.107.99 as permitted sender)
	client-ip=10.180.107.99; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.107.99 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.107.99])
	by 10.180.107.99 with SMTP id hb3mr3342329wib.5.1330771999454 (num_hops
	= 1); Sat, 03 Mar 2012 02:53:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.180.107.99 with SMTP id hb3mr2638337wib.5.1330771999361;
	Sat, 03 Mar 2012 02:53:19 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id v4sm25420842wiy.9.2012.03.03.02.53.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 03 Mar 2012 02:53:18 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Sat,  3 Mar 2012 11:53:08 +0100
Message-Id: <1330771988-13742-3-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1330771988-13742-1-git-send-email-koen@dominion.thruhere.net>
References: <1330771988-13742-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQnxWhto2o3o4fYPh1he3v3NsngUeaysHlI7TicZm+L+R3+xyReW3UWGsJAvy1/8tHCzhEWl
Subject: [PATCH 3/3] README: move meta-angstrom to optional layers
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Sat, 03 Mar 2012 10:53:20 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 README |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/README b/README
index 9bf6154..918c0f1 100644
--- a/README
+++ b/README
@@ -1,4 +1,4 @@
-This layer depends on:
+This layer hard depends on:
 
 URI: git://git.openembedded.org/openembedded-core
 branch: master
@@ -8,6 +8,8 @@ URI: git://git.openembedded.org/meta-openembedded
 branch: master
 revision: HEAD
 
+And optionally depends on:
+
 URI: git://git.angstrom-distribution.org/meta-angstrom
 branch: master
 revision: HEAD
@@ -24,7 +26,7 @@ Arago.
 Due to the above, it is now recommended to follow the instructions at
 http://www.angstrom-distribution.org/building-angstrom
 
-This will set it up for the OpenEmbedded-core layout instead of the
+This will set it up for the OpenEmbedded-core ('yocto') layout instead of the
 old "Classic" OpenEmbedded-dev layout. You can optionally tweak
 sources/layers.txt and conf/bblayers.conf to (de)select BSP layers.
 
-- 
1.7.2.5


