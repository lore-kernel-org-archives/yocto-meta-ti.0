Return-Path: <pab@pabigot.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 096DFE00828; Fri,  9 Jan 2015 15:04:12 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [173.201.193.109 listed in list.dnswl.org]
X-Greylist: delayed 98 seconds by postgrey-1.32 at yocto-www;
	Fri, 09 Jan 2015 15:04:05 PST
Received: from p3plsmtpa08-08.prod.phx3.secureserver.net
	(p3plsmtpa08-08.prod.phx3.secureserver.net [173.201.193.109])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CA2E5E0070B
	for <meta-ti@yoctoproject.org>; Fri,  9 Jan 2015 15:04:05 -0800 (PST)
Received: from [192.168.65.10] ([75.72.225.8])
	by p3plsmtpa08-08.prod.phx3.secureserver.net with 
	id dz2R1p0090BVjqb01z2Ryj; Fri, 09 Jan 2015 16:02:26 -0700
Message-ID: <54B05E0A.9090308@pabigot.com>
Date: Fri, 09 Jan 2015 17:02:34 -0600
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <549D8379.2060800@inventec.ch> <549D8CF3.4080006@pabigot.com>
	<20150109214648.GU4759@edge>
In-Reply-To: <20150109214648.GU4759@edge>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>, nm@ti.com,
	Christian d'Heureuse <chdh@inventec.ch>
Subject: Re: mis-definition of SLEWCTRL_FAST in dt-bindings amxxxx header
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
X-List-Received-Date: Fri, 09 Jan 2015 23:04:12 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 01/09/2015 03:46 PM, Denys Dmytriyenko wrote:
> On Fri, Dec 26, 2014 at 10:29:39AM -0600, Peter A. Bigot wrote:
>> On 12/26/2014 09:49 AM, Christian d'Heureuse wrote:
>>> Hi Peter
>>>
>>> I stumbled on the same error in am33xx.h as you described in September:
>>> https://lists.yoctoproject.org/pipermail/meta-ti/2014-September/005211.html
>>>
>>>
>>> Did you get any reactions?
>> Just the follow-up theorizing it'd been fixed upstream.  As of
>> today, it's still wrong in both am33xx.h and am43xx.h when
>> "upstream" means the torvalds master branch.
>>
>> I keep hoping a TIer will step up, but if not I suppose somebody
>> else has to do it.
>>
>> Maybe E2E will yield results. http://e2e.ti.com/support/arm/sitara_arm/f/791/p/367445/1382229#1382229
>
> Peter,
>
> For the record, here are 2 replies from one of our kernel developers (Cc-ed)
> that I received for my inquiries on your question back in September, stating
> it's in upstream, after which I closed it:
>
>
>> 1. Should rather be SLEWCONTROL like DRA7 rather than _FAST or _SLOW. that
>> avoids all kind of messed up translation.
>>
>> OR should define both _FAST and SLOW for all SoCs equally..
>
>> 2. Even better - if the change - like this one is already present in
>> upstream kernel(which in this case is actually in upstream) - ask the public
>> person to directly ask on linux-omap mailing list (public).
>
> Since meta-ti is not specifically a kernel mailing list, there's less chance
> to get it resolved through here. Please use corresponding upstream mailing
> lists - linux-omap@vger.kernel.org is the closest one here, or either
> devicetree@vger.kernel.org or linux-soc@vger.kernel.org or even E2E forums.
>
> You wouldn't send this to Debian, Ubuntu or even Buildroot mailing lists,
> would you? Similarly, this list is for OpenEmbedded/Yocto layer - the best I
> can do is forward questions and answers back and forth, which is not very
> efficient. So, reporting this on one of the kernel lists would have yelded
> better results, I'd say, since that's where kernel devs are hanging out -
> they don't usually frequent Yocto lists, unfortunately.

OK.  I understand it's out of scope for you and you're frustrated too; 
thanks for trying.  There are enough people aware of it now who should 
have some stake in getting it fixed that I'm not going to search out 
other places to report it.

Peter

