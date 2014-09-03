Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 61E5DE004F5; Wed,  3 Sep 2014 15:44:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (raj.khem[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.213.178 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E2EC3E0049D
	for <meta-ti@yoctoproject.org>; Wed,  3 Sep 2014 15:44:45 -0700 (PDT)
Received: by mail-ig0-f178.google.com with SMTP id hn18so79270igb.11
	for <meta-ti@yoctoproject.org>; Wed, 03 Sep 2014 15:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=9plm3VjqpEVPL0KkqmwqSMieTtWBB5xEYDTg+odCP4g=;
	b=toAl4MgZ8Lur9XIr7OURBav74qm20tHK55HA7F4+7Fz1CCZ/GAC3U46w+uheGF57+N
	YZqDEQXFugQeqo1R4kyIZjlQXaZQ6GW1oCddBT++oMSQb/ch0CHH3MhOMBj9DwRgwrE6
	8XFjI/9cTQ9fBT7CF8K+IIqr8u1ViFAlrtybCtQ5Pl6lDZ2NcAU74MbhuGbd5tr0yZ/z
	hZhPecwa096vOArckXj+tMRaeyIevjE+8fbHNdR1pXZ/i/o3rTyh0hLPAgA94nJCjzw4
	ISBcKC+3g01C2HDwZub/rW46uG1WWTvm9H2QQOu0HpIc+pRW8g6kDOxV0lbg8EcP3M0x
	D4BQ==
X-Received: by 10.50.111.112 with SMTP id ih16mr741290igb.30.1409784285100;
	Wed, 03 Sep 2014 15:44:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.102.67 with HTTP; Wed, 3 Sep 2014 15:44:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 3 Sep 2014 15:44:15 -0700
Message-ID: <CAMKF1spKFXzP_FjhAeodUuxTR8O3EDygsh94Vwgv_Q-pk0J6kg@mail.gmail.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: parsing errors with meta-ti
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
X-List-Received-Date: Wed, 03 Sep 2014 22:44:51 -0000
Content-Type: text/plain; charset=UTF-8

Hi

I am getting

ERROR: Nothing PROVIDES 'libdce' (but
/home/ubuntu/work/upstream/meta-ti/recipes-graphics/omapfbplay/omapfbplay-dce_git.bb
DEPENDS on or otherwise requires it). Close matches:

  libice

  libcec

  libpcre

ERROR: Nothing RPROVIDES 'sox' (but
/home/ubuntu/work/upstream/meta-ti/recipes-ti/beagleboard/beaglebone-tester.bb
RDEPENDS on or otherwise requires it)

NOTE: Runtime target 'sox' is unbuildable, removing...

Missing or unbuildable dependency chain was: ['sox']

NOTE: Runtime target 'beaglebone-tester-dev' is unbuildable, removing...

Missing or unbuildable dependency chain was: ['beaglebone-tester-dev', 'sox']

ERROR: Nothing RPROVIDES 'beaglebone-tester' (but
/home/ubuntu/work/upstream/meta-ti/recipes-ti/beagleboard/beaglebone-tester.bb
RDEPENDS on or otherwise requires it)

ERROR: No eligible RPROVIDERs exist for 'beaglebone-tester'

NOTE: Runtime target 'beaglebone-tester' is unbuildable, removing...

Missing or unbuildable dependency chain was: ['beaglebone-tester']

ERROR: Nothing RPROVIDES 'omapfbplay-dce' (but
/home/ubuntu/work/upstream/meta-ti/recipes-graphics/omapfbplay/omapfbplay-dce_git.bb
RDEPENDS on or otherwise requires it)

ERROR: No eligible RPROVIDERs exist for 'omapfbplay-dce'

NOTE: Runtime target 'omapfbplay-dce' is unbuildable, removing...

Missing or unbuildable dependency chain was: ['omapfbplay-dce']

ERROR: Nothing RPROVIDES 'omapfbplay-dce-dev' (but
/home/ubuntu/work/upstream/meta-ti/recipes-graphics/omapfbplay/omapfbplay-dce_git.bb
RDEPENDS on or otherwise requires it)

ERROR: No eligible RPROVIDERs exist for 'omapfbplay-dce-dev'

NOTE: Runtime target 'omapfbplay-dce-dev' is unbuildable, removing...

Missing or unbuildable dependency chain was: ['omapfbplay-dce-dev']


sox is available in meta-multimedia
http://cgit.openembedded.org/cgit.cgi/meta-openembedded/tree/meta-multimedia/recipes-multimedia/sox/sox_14.4.0.bb?h=master

but meta-ti claims to only depend on oe-core. So either this dep
should be removed or README should be updated to reflect the layerdep

-Khem

