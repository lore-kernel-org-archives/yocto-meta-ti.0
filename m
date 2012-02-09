Return-Path: <ebutera@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 93F87E01370
	for <meta-ti@yoctoproject.org>; Thu,  9 Feb 2012 06:12:54 -0800 (PST)
Received: by eekd4 with SMTP id d4so587582eek.35
	for <meta-ti@yoctoproject.org>; Thu, 09 Feb 2012 06:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=MoxcOLbxHpG5dYXZ0Eg7kgGxAx35qzKvs9t5QCI4q04=;
	b=qjtl0AZ9zIOuY2Sl+duuhuCkeBm5GRr2bpnFkYxGk9L7a/sceof4gggO6Qn+g33gzX
	SHmFSzJXKbzGrhDy+6CvKIseqyXsPPDCjaFJaK6QDCS+ls72+Xvesar5mozHdQ3hEbdl
	EqS5/6fhcY+VvoVlV/hC0znXObpOBZGS6ffNU=
Received: by 10.14.126.194 with SMTP id b42mr685489eei.40.1328796773469;
	Thu, 09 Feb 2012 06:12:53 -0800 (PST)
Received: from localhost.localdomain
	(host164-128-static.225-95-b.business.telecomitalia.it.
	[95.225.128.164])
	by mx.google.com with ESMTPS id c16sm10160426eei.1.2012.02.09.06.12.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 09 Feb 2012 06:12:52 -0800 (PST)
Sender: Enrico Butera <ebutera@gmail.com>
From: Enrico Butera <ebutera@users.berlios.de>
To: meta-ti@yoctoproject.org
Date: Thu,  9 Feb 2012 15:12:44 +0100
Message-Id: <1328796764-20281-1-git-send-email-ebutera@users.berlios.de>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] ti-dmai: build fix
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
X-List-Received-Date: Thu, 09 Feb 2012 14:12:55 -0000

Properly set ${S} dir.

Signed-off-by: Enrico Butera <ebutera@users.berlios.de>
---
 recipes-ti/dmai/ti-dmai.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes-ti/dmai/ti-dmai.inc b/recipes-ti/dmai/ti-dmai.inc
index 8c20384..b22495a 100644
--- a/recipes-ti/dmai/ti-dmai.inc
+++ b/recipes-ti/dmai/ti-dmai.inc
@@ -15,7 +15,7 @@ PE = "1"
 SRCREV               ?= "UNDEFINED_SRCREV"
 DMAIBRANCH           ?= "UNDEFINED_DMAIBRANCH"
 
-S = "${WORKDIR}/${DMAIBRANCH}/davinci_multimedia_application_interface/dmai_${PV}"
+S = "${WORKDIR}/${DMAIBRANCH}/davinci_multimedia_application_interface/dmai_${PV}/dmai"
 
 SRC_URI = "svn://gforge.ti.com/svn/dmai/;module=${DMAIBRANCH};proto=https;user=anonymous;pswd='' \
 		file://loadmodules-ti-dmai-dm6446_al.sh \
-- 
1.7.5.4


