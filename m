Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 89B47E016D8
	for <meta-ti@yoctoproject.org>; Mon,  4 Nov 2013 09:55:57 -0800 (PST)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id B4D4DF81204; Mon,  4 Nov 2013 10:55:56 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id C2F16F81202;
	Mon,  4 Nov 2013 10:55:54 -0700 (MST)
Message-ID: <5277DFB1.7070507@mlbassoc.com>
Date: Mon, 04 Nov 2013 10:56:01 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
References: <1383587507-2528-1-git-send-email-denis@denix.org>
In-Reply-To: <1383587507-2528-1-git-send-email-denis@denix.org>
Subject: Re: [PATCH] mesa: update bbappend to 9.2.2 to match oe-core
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
X-List-Received-Date: Mon, 04 Nov 2013 17:55:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2013-11-04 10:51, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>   recipes-graphics/mesa/{mesa_9.1.6.bbappend => mesa_9.2.2.bbappend} | 0
>   1 file changed, 0 insertions(+), 0 deletions(-)
>   rename recipes-graphics/mesa/{mesa_9.1.6.bbappend => mesa_9.2.2.bbappend} (100%)
>
> diff --git a/recipes-graphics/mesa/mesa_9.1.6.bbappend b/recipes-graphics/mesa/mesa_9.2.2.bbappend
> similarity index 100%
> rename from recipes-graphics/mesa/mesa_9.1.6.bbappend
> rename to recipes-graphics/mesa/mesa_9.2.2.bbappend
>

I thought these were just going to be dropped since they aren't
correct (can't build mesa on OMAP3 because of incorrect provides)
as discussed previously?

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

