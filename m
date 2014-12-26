Return-Path: <pab@pabigot.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E4AC3E008EC; Fri, 26 Dec 2014 08:31:12 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [173.201.192.103 listed in list.dnswl.org]
X-Greylist: delayed 92 seconds by postgrey-1.32 at yocto-www;
	Fri, 26 Dec 2014 08:31:06 PST
Received: from p3plsmtpa06-02.prod.phx3.secureserver.net
	(p3plsmtpa06-02.prod.phx3.secureserver.net [173.201.192.103])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7C426E00824
	for <meta-ti@yoctoproject.org>; Fri, 26 Dec 2014 08:31:06 -0800 (PST)
Received: from [192.168.65.10] ([75.72.225.8])
	by p3plsmtpa06-02.prod.phx3.secureserver.net with 
	id YGVY1p0070BVjqb01GVYyi; Fri, 26 Dec 2014 09:29:33 -0700
Message-ID: <549D8CF3.4080006@pabigot.com>
Date: Fri, 26 Dec 2014 10:29:39 -0600
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Christian d'Heureuse <chdh@inventec.ch>, 
	"meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
References: <549D8379.2060800@inventec.ch>
In-Reply-To: <549D8379.2060800@inventec.ch>
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
X-List-Received-Date: Fri, 26 Dec 2014 16:31:13 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/26/2014 09:49 AM, Christian d'Heureuse wrote:
> Hi Peter
>
> I stumbled on the same error in am33xx.h as you described in September:
> https://lists.yoctoproject.org/pipermail/meta-ti/2014-September/005211.html 
>
>
> Did you get any reactions?

Just the follow-up theorizing it'd been fixed upstream.  As of today, 
it's still wrong in both am33xx.h and am43xx.h when "upstream" means the 
torvalds master branch.

I keep hoping a TIer will step up, but if not I suppose somebody else 
has to do it.

Maybe E2E will yield results. 
http://e2e.ti.com/support/arm/sitara_arm/f/791/p/367445/1382229#1382229

Peter

>
> The error is still in the current Linux source:
>
> https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/tree/include/dt-bindings/pinctrl/am33xx.h 
>
>
> #define SLEWCTRL_FAST           (1 << 6)
>
> In the old Rowboat kernel, the definition was correct:
>
> https://gitorious.org/rowboat/kernel/source/03f2a1e9ea7f8b11ff6809f5a75b614011f8adb6:arch/arm/mach-omap2/mux.h 
>
>
> #define AM33XX_SLEWCTRL_FAST            (0 << 6)
> #define AM33XX_SLEWCTRL_SLOW            (1 << 6)
>
> An in the AM335X Technical Reference Manual
> http://www.ti.com/lit/ug/spruh73k/spruh73k.pdf
> "slewctrl" bit:
> "9.2.2 Pad Control Registers"
> "9.3.1.50 conf_<module>_<pin> Register"
>
> According to 
> https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/log/include/dt-bindings/pinctrl/am33xx.h 
> the author is
> Florian Vaussard <florian.vaussard@epfl.ch> and the committer is 
> Benoit Cousson <benoit.cousson@linaro.org>. Maybe we could write one 
> of them?
>
> Christian
> http://www.source-code.biz  http://www.inventec.ch/chdh


