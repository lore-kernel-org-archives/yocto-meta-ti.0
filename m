Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F139CE003E2
	for <meta-ti@yoctoproject.org>; Tue, 20 Aug 2013 11:55:35 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7KItYg7008153
	for <meta-ti@yoctoproject.org>; Tue, 20 Aug 2013 13:55:34 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7KItYaW013614
	for <meta-ti@yoctoproject.org>; Tue, 20 Aug 2013 13:55:34 -0500
Received: from dlelxv24.itg.ti.com (172.17.1.199) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 20 Aug 2013 13:55:33 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv24.itg.ti.com (8.13.8/8.13.8) with ESMTP id r7KItV97003588;
	Tue, 20 Aug 2013 13:55:32 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 20 Aug 2013 14:26:44 -0500
Message-ID: <1377026806-5651-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [dylan][PATCH 0/2] Update kernel.bbclass for u-boot
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
X-List-Received-Date: Tue, 20 Aug 2013 18:55:38 -0000
Content-Type: text/plain

This patch set mimics the recently sent patchset except the version of
kernel.bbclass that was used in this patchset was from oe-core dylan 
instead of master.


Franklin S. Cooper Jr (2):
  kernel.bbclass: Pull in kernel.bbclass from oe-core dylan
  kernel.bbclass: Pull in tweaks from oe-core patch to local copy

 classes/kernel.bbclass |  396 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 396 insertions(+), 0 deletions(-)
 create mode 100644 classes/kernel.bbclass


