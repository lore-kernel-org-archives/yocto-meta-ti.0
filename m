Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id ED00FE009D9; Tue, 27 Oct 2015 09:56:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8B693E009B8
	for <meta-ti@yoctoproject.org>; Tue, 27 Oct 2015 09:56:46 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t9RGukon001025
	for <meta-ti@yoctoproject.org>; Tue, 27 Oct 2015 11:56:46 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9RGukHp029638
	for <meta-ti@yoctoproject.org>; Tue, 27 Oct 2015 11:56:46 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 27 Oct 2015 11:56:46 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t9RGujO8000414;	Tue, 27 Oct 2015 11:56:45 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 27 Oct 2015 12:56:42 -0400
Message-ID: <1445965004-1470-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [RFC 0/2] LLD cleanup and device split
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
X-List-Received-Date: Tue, 27 Oct 2015 16:56:52 -0000
Content-Type: text/plain

I plan to clean up the LLD recipes and split up the device-specific
libraries to only the relevant machine. There are quite a few LLDs
which will need this clean up so I wanted to submit an RFC before
proceeding with the rest of them.

Jacob Stiffler (2):
  cppi-lld: Clean up recipes
  cppi-lld: Only build binaries relevent to the machine

 recipes-bsp/cppi-lld/cppi-lld-test_git.bb |  2 ++
 recipes-bsp/cppi-lld/cppi-lld.inc         | 24 ++++++++++++++++++------
 recipes-bsp/cppi-lld/cppi-lld_git.bb      | 13 +++++++++++--
 3 files changed, 31 insertions(+), 8 deletions(-)

-- 
1.9.1


