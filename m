Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-bk0-f48.google.com (mail-bk0-f48.google.com
	[209.85.214.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DAB5EE01443
	for <meta-ti@yoctoproject.org>; Mon,  9 Jul 2012 05:36:00 -0700 (PDT)
Received: by bkty5 with SMTP id y5so2909228bkt.35
	for <meta-ti@yoctoproject.org>; Mon, 09 Jul 2012 05:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=wKKUHam5pWhCDSKJGYBG6AoCEMcyyqDdCDis4MIehlw=;
	b=lQZ4rnXK+6oyTvVVmNZ60DNTYIZcJQQLG6CNX4kWMMU9bdfknmbYQ0YrrUe3awW2Du
	8vJlD595jozV7gYZ2kZ7FiNvW/WKgFblGPa0+oPFbMED68fQkj7F4EOcpelW/QcUjvRU
	WusedUiuYyZHibadqNf26JxqdgdGoVHBObwP77aNqkBlhd2k3G8J9lnvqpbAnqroe6xi
	dcyhPVtjjIVG2xjCslXG/f88fOTqEB5PEvcCNa99qWCjvXYG6uA10QHR0bYkHeZH3LJl
	U6VAyoBt3BbiPcoznoRWgEEe1ncDfGHiIucZUd7tKc+7iTnbw1/ECmc8wGTktqYMmQTe
	c+Gg==
Received: by 10.204.0.77 with SMTP id 13mr3017734bka.128.1341837359585;
	Mon, 09 Jul 2012 05:35:59 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-112.unitymediagroup.de.
	[95.222.160.112])
	by mx.google.com with ESMTPS id o4sm26191760bkv.15.2012.07.09.05.35.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 Jul 2012 05:35:58 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: meta-ti@yoctoproject.org
Date: Mon,  9 Jul 2012 14:35:36 +0200
Message-Id: <1341837336-1870-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [PATCH] netbase: follow oe-core to v5.0
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
X-List-Received-Date: Mon, 09 Jul 2012 12:36:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../beagleboard/interfaces                         |    0
 ...{netbase_4.47.bbappend => netbase_5.0.bbappend} |    0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename recipes-core/netbase/{netbase-4.47 => netbase-5.0}/beagleboard/interfaces (100%)
 rename recipes-core/netbase/{netbase_4.47.bbappend => netbase_5.0.bbappend} (100%)

diff --git a/recipes-core/netbase/netbase-4.47/beagleboard/interfaces b/recipes-core/netbase/netbase-5.0/beagleboard/interfaces
similarity index 100%
rename from recipes-core/netbase/netbase-4.47/beagleboard/interfaces
rename to recipes-core/netbase/netbase-5.0/beagleboard/interfaces
diff --git a/recipes-core/netbase/netbase_4.47.bbappend b/recipes-core/netbase/netbase_5.0.bbappend
similarity index 100%
rename from recipes-core/netbase/netbase_4.47.bbappend
rename to recipes-core/netbase/netbase_5.0.bbappend
-- 
1.7.6.5


