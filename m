Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9CC48E0045D; Wed, 14 Sep 2016 09:33:25 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2E80FE0043F
	for <meta-ti@yoctoproject.org>; Wed, 14 Sep 2016 09:33:23 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u8EGXNW5006409
	for <meta-ti@yoctoproject.org>; Wed, 14 Sep 2016 11:33:23 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u8EGXLV3029559
	for <meta-ti@yoctoproject.org>; Wed, 14 Sep 2016 11:33:22 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 14 Sep 2016 11:33:21 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u8EGXLT3026592;
	Wed, 14 Sep 2016 11:33:21 -0500
To: Justin Sobota <jsobota@ti.com>, <meta-ti@yoctoproject.org>
References: <1473868693-3698-1-git-send-email-jsobota@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <27af0528-b235-999b-b097-d24a3e7d2c1f@ti.com>
Date: Wed, 14 Sep 2016 12:33:21 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <1473868693-3698-1-git-send-email-jsobota@ti.com>
Subject: Re: [master/krogoth][PATCH v2 3/6] pa-lld: Bump version and remove makefile error patch
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
X-List-Received-Date: Wed, 14 Sep 2016 16:33:25 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

ACK


This fixes the issue seen with the previous patch.


On 9/14/2016 11:58 AM, Justin Sobota wrote:
> Signed-off-by: Justin Sobota <jsobota@ti.com>
> ---
>   ...akefile_armv7-fix-missing-separator-error.patch |   30 --------------------
>   recipes-bsp/pa-lld/pa-lld.inc                      |   11 ++++---
>   2 files changed, 5 insertions(+), 36 deletions(-)
>   delete mode 100644 recipes-bsp/pa-lld/files/0001-makefile_armv7-fix-missing-separator-error.patch
>
> diff --git a/recipes-bsp/pa-lld/files/0001-makefile_armv7-fix-missing-separator-error.patch b/recipes-bsp/pa-lld/files/0001-makefile_armv7-fix-missing-separator-error.patch
> deleted file mode 100644
> index 2ff41d3..0000000
> --- a/recipes-bsp/pa-lld/files/0001-makefile_armv7-fix-missing-separator-error.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From 60a938e6902c7cb8bec34abbc5a3723c8094d728 Mon Sep 17 00:00:00 2001
> -From: Denys Dmytriyenko <denys@ti.com>
> -Date: Tue, 1 Dec 2015 00:00:00 -0500
> -Subject: [PATCH] makefile_armv7: fix missing separator error
> -
> -Doesn't seem to work in all versions of Make, fails like this:
> -makefile_armv7:27: *** missing separator.  Stop.
> -
> -Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ----
> - makefile_armv7 | 3 ---
> - 1 file changed, 3 deletions(-)
> -
> -diff --git a/makefile_armv7 b/makefile_armv7
> -index a2bc4f6..1ae6e0a 100644
> ---- a/makefile_armv7
> -+++ b/makefile_armv7
> -@@ -24,9 +24,6 @@ else
> -     export LLD_NAME=pa
> - endif
> -
> --echo DEVICE=$(DEVICE)
> --echo LLD_NAME=$(LLD_NAME)
> --
> - # Output for prebuilt generated libraries
> - export ARMV7LIBDIR ?= ./lib
> - export ARMV7OBJDIR ?= ./obj/$(DEVICE)
> ---
> -2.2.0
> -
> diff --git a/recipes-bsp/pa-lld/pa-lld.inc b/recipes-bsp/pa-lld/pa-lld.inc
> index 6c51560..0b2a4cc 100644
> --- a/recipes-bsp/pa-lld/pa-lld.inc
> +++ b/recipes-bsp/pa-lld/pa-lld.inc
> @@ -9,16 +9,15 @@ PA_LLD_GIT_PROTOCOL = "git"
>   PA_LLD_GIT_BRANCH = "master"
>   PA_LLD_GIT_DESTSUFFIX = "git/ti/drv/pa"
>   
> -# Below Commit ID corresponds to "DEV.PA_LLD.03.00.01.12"
> -PA_LLD_SRCREV = "d3f3f5d93d3febc24099974bbc77e67c80a83b1e"
> +# Below Commit ID corresponds to "DEV.PA_LLD.03.00.02.00"
> +PA_LLD_SRCREV = "dca2a281c0c57f3b3018a93fae5485825a33042c"
>   
>   BRANCH = "${PA_LLD_GIT_BRANCH}"
> -SRC_URI = "${PA_LLD_GIT_URI};destsuffix=${PA_LLD_GIT_DESTSUFFIX};protocol=${PA_LLD_GIT_PROTOCOL};branch=${BRANCH} \
> -            file://0001-makefile_armv7-fix-missing-separator-error.patch"
> +SRC_URI = "${PA_LLD_GIT_URI};destsuffix=${PA_LLD_GIT_DESTSUFFIX};protocol=${PA_LLD_GIT_PROTOCOL};branch=${BRANCH}"
>   SRCREV = "${PA_LLD_SRCREV}"
>   
> -PV = "03.00.01.12"
> -INC_PR = "r2"
> +PV = "03.00.02.00"
> +INC_PR = "r0"
>   
>   S = "${WORKDIR}/${PA_LLD_GIT_DESTSUFFIX}"
>   


