Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 42ED4E01275
	for <meta-ti@yoctoproject.org>; Thu, 10 Jan 2013 23:54:38 -0800 (PST)
Received: by mail-ee0-f44.google.com with SMTP id l10so686203eei.17
	for <meta-ti@yoctoproject.org>; Thu, 10 Jan 2013 23:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=DE2RI1/aXacOaUCXiBrscdFEMham8T74oj4mFTuC888=;
	b=LSoLBaQjSQfwSXIwiWWYs4PM+9yhkXjE/Nf9oFMgPwWIdc4Y0WNPR2HCXdQrxdIfby
	fLa+AsrxQ5kSG2vRwTSQy88RMtEm8TPdbdRMyhwmPq7r5Cq8wZED1r6U1L+UqgXcCl/6
	qTGg6DkOekubtuuPufvle5ll+eXFI7Jje5lpFK6rKWWlK1dcm3IYrUB5R20XYkHOetc0
	OVChRz7Blt+MrU9pr/eyW0Zm0n63NvgjL7ueGTwvIbhCGXWLhKFo6xlxROZr0DCruOKC
	xbQBL33/kLxuMwmg9+cqu88o/1hbzd+luEC7T6/AcxE9l5721mMQi7DpqQgprUY92Iow
	4i4Q==
X-Received: by 10.14.202.3 with SMTP id c3mr199889948eeo.4.1357890877075;
	Thu, 10 Jan 2013 23:54:37 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-251-141.unitymediagroup.de.
	[95.223.251.141])
	by mx.google.com with ESMTPS id q44sm7488851eep.5.2013.01.10.23.54.35
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 10 Jan 2013 23:54:36 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: meta-ti@yoctoproject.org
Date: Fri, 11 Jan 2013 08:52:53 +0100
Message-Id: <1357890773-29130-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [PATCH] mesa-dri: update to 9.0.1 to match oe-core
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
X-List-Received-Date: Fri, 11 Jan 2013 07:54:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

this makes Cliff Brake's unapplied patch obsolete

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...-dri_8.0.4.bbappend => mesa-dri_9.0.1.bbappend} |    0
 1 files changed, 0 insertions(+), 0 deletions(-)
 rename recipes-graphics/mesa/{mesa-dri_8.0.4.bbappend => mesa-dri_9.0.1.bbappend} (100%)

diff --git a/recipes-graphics/mesa/mesa-dri_8.0.4.bbappend b/recipes-graphics/mesa/mesa-dri_9.0.1.bbappend
similarity index 100%
rename from recipes-graphics/mesa/mesa-dri_8.0.4.bbappend
rename to recipes-graphics/mesa/mesa-dri_9.0.1.bbappend
-- 
1.7.6.5


