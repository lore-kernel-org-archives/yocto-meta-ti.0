Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8C9CDE0090F; Fri,  9 Jan 2015 08:30:47 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DF548E0070B
	for <meta-ti@yoctoproject.org>; Fri,  9 Jan 2015 08:30:36 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 0951A529E0; Fri,  9 Jan 2015 16:30:35 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150109163036.0951A529E0@arago-project.org>
Date: Fri,  9 Jan 2015 16:30:35 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : multi-kernel: update to work with latest code
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
X-List-Received-Date: Fri, 09 Jan 2015 16:30:47 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: d281b5a96e7cee6a8e3bd710165dea434b898602
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=d281b5a96e7cee6a8e3bd710165dea434b898602

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Jan  9 05:34:19 2015 +0000

multi-kernel: update to work with latest code

Handle multi-config kernel builds with separate namespaces to allow installing
them side by side safely.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../linux/linux-ti-staging-3.14/configs/systest    |    1 +
 recipes-kernel/linux/linux-ti-staging_3.14.bb      |   13 +-
 recipes-kernel/linux/multi-kernel.inc              |  137 ++++++++++----------
 3 files changed, 76 insertions(+), 75 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=d281b5a96e7cee6a8e3bd710165dea434b898602

