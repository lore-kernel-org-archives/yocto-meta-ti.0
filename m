Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B2D0FE009E6; Fri, 13 Sep 2019 12:30:59 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 09FBEE00994
	for <meta-ti@yoctoproject.org>; Fri, 13 Sep 2019 12:30:58 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8DJUwU6046137;
	Fri, 13 Sep 2019 14:30:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568403058;
	bh=/jRkJp4M+jAAVNLUHnvFW6cD8xS316r4iQ2J8aM8SUI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=XdGx8NuBLBgFNgTxjeeTathQK9hz8bIZEmRdpEGX5txIE82EaGhWBveU7zY1xf9xe
	yAxZKtZ4mg/c/JYwAoRhHOEWGgQgnLbGWx9ZdF84E5i9bOKfVJlpUmmS78j0DkdEAb
	XYVzZ6Kh/kB+vKO/FkZ+np1/PR+jtlxKgoYSmc1Q=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8DJUwSj113099
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 Sep 2019 14:30:58 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 13 Sep 2019 14:30:57 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 13 Sep 2019 14:30:57 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8DJUv1R112556;
	Fri, 13 Sep 2019 14:30:57 -0500
Date: Fri, 13 Sep 2019 15:30:57 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190913193057.GD8889@beryl>
References: <1568344904-32388-1-git-send-email-denys@ti.com>
	<CAMKF1sqG2T3e9+swGyyT2J8OAXWqPfedyyr06PWpOyS8A4R4VA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqG2T3e9+swGyyT2J8OAXWqPfedyyr06PWpOyS8A4R4VA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [thud/master][PATCH] ion: add libion and ion-tests packages for ION support
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
X-List-Received-Date: Fri, 13 Sep 2019 19:30:59 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ok, I'll take a look. Thanks.

On Fri, Sep 13, 2019 at 06:24:48AM -0700, Khem Raj wrote:
> thai breaks on musl  see
> 
> https://errors.yoctoproject.org/Errors/Details/270173/
> 
> a patch like meta/recipes-support/attr/attr/dont-use-decl-macros.patch
> from oe-core will solve it. Care to fix ?
> 
> On Thu, Sep 12, 2019 at 8:22 PM Denys Dmytriyenko <denys@ti.com> wrote:
> >
> > ION Userspace Memory Allocator Library and tests
> >
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  ...-CMakeLists.txt-disable-phys-addr-for-now.patch | 34 ++++++++++++++++++++++
> >  recipes-devtools/ion/ion-tests_git.bb              | 18 ++++++++++++
> >  recipes-devtools/ion/libion_git.bb                 | 14 +++++++++
> >  3 files changed, 66 insertions(+)
> >  create mode 100644 recipes-devtools/ion/ion-tests/0001-CMakeLists.txt-disable-phys-addr-for-now.patch
> >  create mode 100644 recipes-devtools/ion/ion-tests_git.bb
> >  create mode 100644 recipes-devtools/ion/libion_git.bb
> >
> > diff --git a/recipes-devtools/ion/ion-tests/0001-CMakeLists.txt-disable-phys-addr-for-now.patch b/recipes-devtools/ion/ion-tests/0001-CMakeLists.txt-disable-phys-addr-for-now.patch
> > new file mode 100644
> > index 0000000..7cf5895
> > --- /dev/null
> > +++ b/recipes-devtools/ion/ion-tests/0001-CMakeLists.txt-disable-phys-addr-for-now.patch
> > @@ -0,0 +1,34 @@
> > +From 85264fc72a261d20107a50ea2fad0258900a132b Mon Sep 17 00:00:00 2001
> > +From: Denys Dmytriyenko <denys@ti.com>
> > +Date: Sat, 20 Apr 2019 16:54:03 +0000
> > +Subject: [PATCH] CMakeLists.txt: disable phys-addr for now
> > +
> > +Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > +---
> > + CMakeLists.txt | 13 -------------
> > + 1 file changed, 13 deletions(-)
> > +
> > +diff --git a/CMakeLists.txt b/CMakeLists.txt
> > +index 1d60003..eca6ba7 100644
> > +--- a/CMakeLists.txt
> > ++++ b/CMakeLists.txt
> > +@@ -54,16 +54,3 @@ target_link_libraries(ion-print-heaps
> > + target_include_directories(ion-print-heaps PUBLIC ${LIBION_INCLUDE_DIRS})
> > +
> > + install(TARGETS ion-print-heaps RUNTIME DESTINATION bin)
> > +-
> > +-# phys-addr
> > +-
> > +-add_executable(phys-addr
> > +-      src/phys-addr.c
> > +-)
> > +-
> > +-target_link_libraries(phys-addr
> > +-      ${LIBION_LIBRARIES}
> > +-)
> > +-target_include_directories(phys-addr PUBLIC ${LIBION_INCLUDE_DIRS})
> > +-
> > +-install(TARGETS phys-addr RUNTIME DESTINATION bin)
> > +--
> > +2.17.1
> > +
> > diff --git a/recipes-devtools/ion/ion-tests_git.bb b/recipes-devtools/ion/ion-tests_git.bb
> > new file mode 100644
> > index 0000000..831f5e8
> > --- /dev/null
> > +++ b/recipes-devtools/ion/ion-tests_git.bb
> > @@ -0,0 +1,18 @@
> > +SUMMARY = "Test cases for ION"
> > +HOMEPAGE = "https://github.com/glneo/ion-tests"
> > +LICENSE = "Apache-2.0"
> > +LIC_FILES_CHKSUM = "file://src/ion_test.c;beginline=1;endline=15;md5=b225db900869a4cd31461606e55a3ec5"
> > +
> > +PV = "1.0"
> > +
> > +BRANCH = "master"
> > +SRC_URI = "git://github.com/glneo/ion-tests.git;protocol=git;branch=${BRANCH} \
> > +       file://0001-CMakeLists.txt-disable-phys-addr-for-now.patch \
> > +"
> > +SRCREV = "70d730cebca29e6fd37b21d9beac82ae645f3900"
> > +
> > +DEPENDS = "libion gtest"
> > +
> > +S = "${WORKDIR}/git"
> > +
> > +inherit cmake pkgconfig
> > diff --git a/recipes-devtools/ion/libion_git.bb b/recipes-devtools/ion/libion_git.bb
> > new file mode 100644
> > index 0000000..7c93ed3
> > --- /dev/null
> > +++ b/recipes-devtools/ion/libion_git.bb
> > @@ -0,0 +1,14 @@
> > +SUMMARY = "ION Userspace Memory Allocator Library"
> > +HOMEPAGE = "https://github.com/glneo/libion"
> > +LICENSE = "Apache-2.0"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
> > +
> > +PV = "1.0.0"
> > +
> > +BRANCH = "master"
> > +SRC_URI = "git://github.com/glneo/libion.git;protocol=git;branch=${BRANCH}"
> > +SRCREV = "11dad7977ec3ecba37c013da7ec0408c01413000"
> > +
> > +S = "${WORKDIR}/git"
> > +
> > +inherit cmake pkgconfig
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti

