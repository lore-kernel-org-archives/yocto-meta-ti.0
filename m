Return-Path: <schnitzeltony@gmx.de>
Received: from mailout-de.gmx.net (mailout-de.gmx.net [213.165.64.22])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 4ED16E0054F
	for <meta-ti@yoctoproject.org>; Mon, 31 Oct 2011 16:48:17 -0700 (PDT)
Received: (qmail invoked by alias); 31 Oct 2011 23:48:10 -0000
Received: from p5B0A152D.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.21.45]
	by mail.gmx.net (mp064) with SMTP; 01 Nov 2011 00:48:10 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+yKHpjYVKyNLGcMkZGS8xeox+KIgM6nGebjnAPMD
	5ddT40BA8so07b
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: meta-ti@yoctoproject.org
Date: Tue,  1 Nov 2011 00:52:46 +0100
Message-Id: <1320105166-11309-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [PATCH] netbase: follow oe-core update to 4.46
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
X-List-Received-Date: Mon, 31 Oct 2011 23:48:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 .../beagleboard/interfaces                         |    0
 ...netbase_4.45.bbappend => netbase_4.46.bbappend} |    0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename recipes-core/netbase/{netbase-4.45 => netbase-4.46}/beagleboard/interfaces (100%)
 rename recipes-core/netbase/{netbase_4.45.bbappend => netbase_4.46.bbappend} (100%)

diff --git a/recipes-core/netbase/netbase-4.45/beagleboard/interfaces b/recipes-core/netbase/netbase-4.46/beagleboard/interfaces
similarity index 100%
rename from recipes-core/netbase/netbase-4.45/beagleboard/interfaces
rename to recipes-core/netbase/netbase-4.46/beagleboard/interfaces
diff --git a/recipes-core/netbase/netbase_4.45.bbappend b/recipes-core/netbase/netbase_4.46.bbappend
similarity index 100%
rename from recipes-core/netbase/netbase_4.45.bbappend
rename to recipes-core/netbase/netbase_4.46.bbappend
-- 
1.7.4.4


