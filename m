Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CF282E002A5
	for <meta-ti@yoctoproject.org>; Wed,  8 Aug 2012 10:24:07 -0700 (PDT)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id ECB96F811EF; Wed,  8 Aug 2012 11:24:06 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 98E96F811E5;
	Wed,  8 Aug 2012 11:24:05 -0600 (MDT)
Message-ID: <5022A0BC.5090209@mlbassoc.com>
Date: Wed, 08 Aug 2012 11:24:12 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
References: <1343990569-24683-1-git-send-email-robert@linuxdevelopment.de>
In-Reply-To: <1343990569-24683-1-git-send-email-robert@linuxdevelopment.de>
Subject: Re: [PATCH] fix oe warning about wrong use of proto instead of protocol
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
X-List-Received-Date: Wed, 08 Aug 2012 17:24:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 2012-08-03 04:42, Robert Woerle wrote:
> Signed-off-by: Robert Woerle <robert@linuxdevelopment.de>
> ---
>   recipes-ti/dmai/ti-dmai.inc |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-ti/dmai/ti-dmai.inc b/recipes-ti/dmai/ti-dmai.inc
> index 23481b7..58955b5 100644
> --- a/recipes-ti/dmai/ti-dmai.inc
> +++ b/recipes-ti/dmai/ti-dmai.inc
> @@ -17,7 +17,7 @@ DMAIBRANCH           ?= "UNDEFINED_DMAIBRANCH"
>
>   S = "${WORKDIR}/${DMAIBRANCH}/davinci_multimedia_application_interface/dmai_${PV}/dmai"
>
> -SRC_URI = "svn://gforge.ti.com/svn/dmai/;module=${DMAIBRANCH};proto=https;user=anonymous;pswd='' \
> +SRC_URI = "svn://gforge.ti.com/svn/dmai/;module=${DMAIBRANCH};protocol=https;user=anonymous;pswd='' \
>   		file://loadmodules-ti-dmai-dm6446_al.sh \
>   		file://loadmodules-ti-dmai-dm6467_al.sh \
>   		file://loadmodules-ti-dmai-o3530_al.sh \
>

Already in the tree:

commit 131d02fe360a39f3805a9281dd580e9f28d9ca53
Author: Andreas Müller <schnitzeltony@googlemail.com>
Date:   Wed Aug 1 11:35:48 2012 +0200

     ti-dmai.inc: fix 'proto='-warning on recipe parsing

     Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
     Signed-off-by: Denys Dmytriyenko <denys@ti.com>

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

