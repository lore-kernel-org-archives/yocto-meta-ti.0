Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3598BE00DAC; Wed, 29 Jun 2016 06:57:17 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [198.47.19.12])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1ED34E0086E
	for <meta-ti@yoctoproject.org>; Wed, 29 Jun 2016 06:57:08 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u5TDv8dZ028751
	for <meta-ti@yoctoproject.org>; Wed, 29 Jun 2016 08:57:08 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5TDv7we013965
	for <meta-ti@yoctoproject.org>; Wed, 29 Jun 2016 08:57:08 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 29 Jun 2016 08:57:07 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5TDv7lT021227;
	Wed, 29 Jun 2016 08:57:07 -0500
Date: Wed, 29 Jun 2016 09:57:07 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20160629135706.GD24597@edge>
References: <1467136085-24211-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1467136085-24211-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] ti-ipc-rtos: add dependency on zip-native
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
X-List-Received-Date: Wed, 29 Jun 2016 13:57:17 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ack


On Tue, Jun 28, 2016 at 01:48:05PM -0400, Jacob Stiffler wrote:
> * The zip utility is used during the build
> 
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  recipes-ti/ipc/ti-ipc-rtos_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-ti/ipc/ti-ipc-rtos_git.bb b/recipes-ti/ipc/ti-ipc-rtos_git.bb
> index 740de53..379dcd0 100644
> --- a/recipes-ti/ipc/ti-ipc-rtos_git.bb
> +++ b/recipes-ti/ipc/ti-ipc-rtos_git.bb
> @@ -35,9 +35,9 @@ SRCREV_ipc-metadata = "c3fc63be358c8c9a429366ebf54fe03812671129"
>  S_ipc-examples = "${WORKDIR}/git/ipc-examples"
>  S_ipc-metadata = "${WORKDIR}/git/ipc-metadata"
>  
> -PR = "${INC_PR}.0"
> +PR = "${INC_PR}.1"
>  
> -DEPENDS = "ti-xdctools ti-sysbios doxygen-native"
> +DEPENDS = "ti-xdctools ti-sysbios doxygen-native zip-native"
>  DEPENDS_append_keystone = " ti-cgt6x-native \
>                              gcc-arm-none-eabi-native \
>  "
> -- 
> 2.7.4
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

