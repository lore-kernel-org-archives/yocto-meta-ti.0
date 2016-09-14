Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D20ADE0045D; Wed, 14 Sep 2016 09:32:55 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [198.47.19.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7A884E0043B
	for <meta-ti@yoctoproject.org>; Wed, 14 Sep 2016 09:32:52 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u8EGWoUl025435
	for <meta-ti@yoctoproject.org>; Wed, 14 Sep 2016 11:32:50 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u8EGWoXe028965
	for <meta-ti@yoctoproject.org>; Wed, 14 Sep 2016 11:32:50 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 14 Sep 2016 11:32:50 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u8EGWoCY010306;
	Wed, 14 Sep 2016 11:32:50 -0500
To: Justin Sobota <jsobota@ti.com>, <meta-ti@yoctoproject.org>
References: <1473868738-3737-1-git-send-email-jsobota@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <5180c333-6990-1149-bb99-bbd16dc5a3a0@ti.com>
Date: Wed, 14 Sep 2016 12:32:50 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <1473868738-3737-1-git-send-email-jsobota@ti.com>
Subject: Re: [master/krogoth][PATCH v2 6/6] ti-pdk-build-rtos: Bump version and add comp_top.mk to install
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
X-List-Received-Date: Wed, 14 Sep 2016 16:32:55 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

ACK


This fixes the issue seen with common-csl-ip-rtos.


On 9/14/2016 11:58 AM, Justin Sobota wrote:
> Signed-off-by: Justin Sobota <jsobota@ti.com>
> ---
>   recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb |    9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
> index 3a3ab55..36fd360 100644
> --- a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
> +++ b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
> @@ -4,15 +4,15 @@ LIC_FILES_CHKSUM = "file://makerules/env.mk;beginline=1;endline=31;md5=10503e8de
>   
>   require recipes-ti/includes/ti-paths.inc
>   
> -PV = "01.00.00.00A"
> -PR = "r4"
> +PV = "01.00.00.02"
> +PR = "r0"
>   
>   PDK_BUILD_GIT_URI = "git://git.ti.com/keystone-rtos/processor-pdk-build.git"
>   PDK_BUILD_GIT_PROTOCOL = "git"
>   PDK_BUILD_GIT_BRANCH = "master"
>   
> -# Below Commit ID corresponds to "DEV.PDK_BUILD.01.00.00.00A"
> -PDK_BUILD_SRCREV = "8a026319765cc125e2daef709841bb3ce1a8d325"
> +# Below Commit ID corresponds to "DEV.PDK_BUILD.01.00.00.02"
> +PDK_BUILD_SRCREV = "0bbd9d2fdff205fda4893936d7cb71404c003b93"
>   
>   BRANCH = "${PDK_BUILD_GIT_BRANCH}"
>   SRC_URI = "${PDK_BUILD_GIT_URI};protocol=${PDK_BUILD_GIT_PROTOCOL};branch=${BRANCH}"
> @@ -36,6 +36,7 @@ do_install() {
>       install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/am572x
>       
>       install -m 0755 Rules.make ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build
> +    install -m 0755 comp_top.mk ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build
>   
>       sed -i -e "s|c\:/ti/ccsv5/utils/cygwin|\$(XDC_INSTALL_PATH)/bin|g" \
>           ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/Rules.make


