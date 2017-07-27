Return-Path: <e-ruei1@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CD4C8E00CCB; Thu, 27 Jul 2017 14:23:12 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.17 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 622D1E00B8E
	for <meta-ti@yoctoproject.org>; Thu, 27 Jul 2017 14:23:10 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6RLNAOQ010883
	for <meta-ti@yoctoproject.org>; Thu, 27 Jul 2017 16:23:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1501190590;
	bh=ckoUMmPCTFJdioaLYfB5NNrlV9LJWS2Aqm3XXHUkMwg=;
	h=From:To:Subject:Date;
	b=QNui8HyztTM3aKX0Eftn2JWya3GOeBTlkIFoXsaASwzKAst4E95wBFeYMtYDWDUQn
	Xnm269clTzvh1uk7L0Q6ziN4vzJOkBBE/+HdBbo4PvTRvTzv4+y3z4n4aSnS+cDpfV
	MUX61lVXx7mGpujQ081b9GbZlvr6VFoX0r0jaFHk=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6RLNAMJ012404
	for <meta-ti@yoctoproject.org>; Thu, 27 Jul 2017 16:23:10 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 27 Jul 2017 16:23:09 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v6RLN9IU026111	for <meta-ti@yoctoproject.org>; Thu, 27 Jul 2017 16:23:10
	-0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 27 Jul 2017 17:22:59 -0400
Message-ID: <1501190583-48494-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [morty/master][PATCH 0/4] matrix-gui: add browser demos
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
X-List-Received-Date: Thu, 27 Jul 2017 21:23:12 -0000
Content-Type: text/plain

OOB Matrix Gui: add browser submenu and browser demos

Eric Ruei (4):
  matrix-gui-apps-git: bump SRCREV to pick up the browser demos
  matix-gui-browser-demos: add browser demos
  matrix-gui-submenu: add browser submenu
  packagegroup-arago-tisdk-matrix: add browser demos for AM5/DRA7

 .../packagegroups/packagegroup-arago-tisdk-matrix.bb     |  3 ++-
 .../recipes-core/matrix/matrix-gui-apps-git.inc          |  4 ++--
 .../recipes-core/matrix/matrix-gui-browser-demos_2.0.bb  | 16 ++++++++++++++++
 .../recipes-core/matrix/matrix-gui-submenus_2.0.bb       |  5 ++++-
 4 files changed, 24 insertions(+), 4 deletions(-)
 create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-browser-demos_2.0.bb

-- 
1.9.1


