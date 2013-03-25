Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ea0-f174.google.com (mail-ea0-f174.google.com
	[209.85.215.174])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A540FE0140A
	for <meta-ti@yoctoproject.org>; Mon, 25 Mar 2013 01:11:41 -0700 (PDT)
Received: by mail-ea0-f174.google.com with SMTP id m14so51016eaj.19
	for <meta-ti@yoctoproject.org>; Mon, 25 Mar 2013 01:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=1Yl/oUp5ywyFfZDl7DmWv2z/z77OhIxAq+NeF5TJ97s=;
	b=U/jLnukuqUCWYQDGmC4icyGWUY9f4XG2zIUcOtLwJCLGMarZ03Bay2TnbHXi1UfGqC
	bUiT2TARzNAf7N49Md6eG2yDyiimZSsyz12uVVmTY95rwTDzBhG48s1mpnlm0wqzPinH
	pPdr+Yo9NL/XWTwpYnNlfRh3fp5QTKAsME+J9bV0uJ5IAfuuQ3fu78qC2VtHYvm3H8D7
	iGDkP03XsPK6sT+uKQrVe1s+qKLXNlhihsgSKPSp4LdVQDMI1woOnQ6ayPPhr0fIgX0F
	XcoV8beQ7dfpZnVZ4+59ICx06juO7oiE2Pi9WkNi6cj1NkliH+KPEjHBj9e5o8sjMWyL
	4WUQ==
X-Received: by 10.14.4.69 with SMTP id 45mr31747941eei.0.1364199100126;
	Mon, 25 Mar 2013 01:11:40 -0700 (PDT)
Received: from localhost.localdomain (ip-95-223-251-141.unitymediagroup.de.
	[95.223.251.141])
	by mx.google.com with ESMTPS id 3sm17351240eej.6.2013.03.25.01.11.38
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 25 Mar 2013 01:11:39 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: meta-ti@yoctoproject.org
Date: Mon, 25 Mar 2013 09:09:30 +0100
Message-Id: <1364198970-22271-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [PATCH] mesa-dri: follow oe-core's renaming to mesa
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
X-List-Received-Date: Mon, 25 Mar 2013 08:11:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...mesa-dri_9.0.2.bbappend => mesa_9.0.2.bbappend} |    0
 .../{mesa-dri_git.bbappend => mesa_git.bbappend}   |    0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename recipes-graphics/mesa/{mesa-dri_9.0.2.bbappend => mesa_9.0.2.bbappend} (100%)
 rename recipes-graphics/mesa/{mesa-dri_git.bbappend => mesa_git.bbappend} (100%)

diff --git a/recipes-graphics/mesa/mesa-dri_9.0.2.bbappend b/recipes-graphics/mesa/mesa_9.0.2.bbappend
similarity index 100%
rename from recipes-graphics/mesa/mesa-dri_9.0.2.bbappend
rename to recipes-graphics/mesa/mesa_9.0.2.bbappend
diff --git a/recipes-graphics/mesa/mesa-dri_git.bbappend b/recipes-graphics/mesa/mesa_git.bbappend
similarity index 100%
rename from recipes-graphics/mesa/mesa-dri_git.bbappend
rename to recipes-graphics/mesa/mesa_git.bbappend
-- 
1.7.6.5


