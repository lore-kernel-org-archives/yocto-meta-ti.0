Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2E97DE0027E
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2012 09:31:48 -0700 (PDT)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id D4EADF81206; Thu, 27 Sep 2012 10:31:47 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 137E8F81205;
	Thu, 27 Sep 2012 10:31:47 -0600 (MDT)
Message-ID: <50647F76.6020109@mlbassoc.com>
Date: Thu, 27 Sep 2012 10:31:50 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
References: <506307F1.6030303@intel.com>
	<EF446FF9DAC93B479C74AB9153DE173F111237C8@SMUCM08V.europe.bmw.corp>
	<CA+2YH7uT8AcfDw3Ed0CzTXOH7qd_9MO4uYi8QXKxVmYpMJnzTQ@mail.gmail.com>
	<EF446FF9DAC93B479C74AB9153DE173F1117CA4D@SMUCM08V.europe.bmw.corp>
	<CA+2YH7vSDK0CS6Yh1pu26qygOhiKZycA0or7EXtF-Z09ntQvjw@mail.gmail.com>
	<EF446FF9DAC93B479C74AB9153DE173F1117CBFB@SMUCM08V.europe.bmw.corp>
	<CAMKF1sojfxBhzj-4K7j77Jdv5zhJQ9g3A2XBQ4CxkdUhy=se4g@mail.gmail.com>
	<506479FF.8050305@mlbassoc.com>
	<CAMKF1sp1dD7qoaQ=JpM_RmgZS65GRKcUcBka9q=0TWbtAzEVHQ@mail.gmail.com>
	<CA+2YH7ssSvi323th0dHxP_wzB9H7he23HuhvtKNbAzb+K_n-Fg@mail.gmail.com>
	<20120927162455.GA7653@edge>
In-Reply-To: <20120927162455.GA7653@edge>
Subject: Re: pandaboard not booting
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
X-List-Received-Date: Thu, 27 Sep 2012 16:31:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-09-27 10:24, Denys Dmytriyenko wrote:
> On Thu, Sep 27, 2012 at 06:22:42PM +0200, Enrico wrote:
>> On Thu, Sep 27, 2012 at 6:10 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>> On Thu, Sep 27, 2012 at 9:08 AM, Gary Thomas <gary@mlbassoc.com> wrote:
>>>> I've tried this kernel on a PandaBoard, built with both GCC-4.7.2 (latest
>>>> master)
>>>> and GCC-4.6.3 (~denzil).  Both fail during to come up.
>>>
>>> OK you can take further step back and use edison SDK which has gcc 4.5
>>> which then can _kind_ of eliminate the compiler if it fails with all 3
>>
>> Or take a step forward and try a newer kernel ;)
>
> Well, the current kernel used to work at least on Pandaboard ES...

I build the Panda kernel (based on the latest TI/Ubuntu tree ti-ubuntu-3.4-1485.7 branch)
all the time with the Yocto toolchain & it works just fine.

I also tried the off-the-shelf 3.1.0 which worked as well.

There must be something odd about the 3.1 kernel built from the linux-omap4-3.1.0
recipe which is the default when built using Yocto+meta-ti

n.b. this is the end of my experiments on this subject; I was only
trying to help in case it was a toolchain issue since I have the old
tools still around.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

