Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 04AF5E00294
	for <meta-ti@yoctoproject.org>; Wed, 28 Nov 2012 09:28:52 -0800 (PST)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id A627CF811DA; Wed, 28 Nov 2012 10:28:51 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 92402F81188;
	Wed, 28 Nov 2012 10:28:49 -0700 (MST)
Message-ID: <50B649FB.30609@mlbassoc.com>
Date: Wed, 28 Nov 2012 10:29:31 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121028 Thunderbird/16.0.2
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <50B64752.6080607@mlbassoc.com> <20121128171902.GB7172@edge>
In-Reply-To: <20121128171902.GB7172@edge>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Can't build recipes-graphics/xorg-xserver/xf86-video-omap_git.bb
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
X-List-Received-Date: Wed, 28 Nov 2012 17:28:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-11-28 10:19, Denys Dmytriyenko wrote:
> http://thread.gmane.org/gmane.linux.embedded.yocto.meta-ti/1196

Bottom line: I should just use the latest Poky/Yocto tree?  I just updated
the meta-ti(master) and the quoted patches don't seem to have been applied
(the xf86-video-omap_git.bb is still present)

>
> On Wed, Nov 28, 2012 at 10:18:10AM -0700, Gary Thomas wrote:
>> When trying to build this recipe, I get this error:
>>
>> configure: error: Package requirements (xorg-server >= 1.3 xproto fontsproto libdrm >= 2.4.36 libdrm_omap xf86driproto  randrproto renderproto videoproto xextproto) were not met:
>> No package 'libdrm_omap' found
>>
>> Where can I find this package?
>>
>> Thanks

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

