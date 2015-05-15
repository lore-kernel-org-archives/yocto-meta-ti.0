Return-Path: <b.hutchman@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8BD27E009EB; Fri, 15 May 2015 06:55:52 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (b.hutchman[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.218.48 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com
	[209.85.218.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4CD69E0095F;
	Fri, 15 May 2015 06:55:45 -0700 (PDT)
Received: by oign205 with SMTP id n205so82562221oig.2;
	Fri, 15 May 2015 06:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=H71HlWhy1ZoVW+QAYfrDjRDVpwfcNZAuyHOFfctSFgc=;
	b=VSteSNaieCOoNfgm4KCFgq0cK7iklsOfggeMM7nk8PkGs5KCxVT2tmGVu+vryhgeqV
	jrBfueDwZHwQyyjpzumxdfhcYhyxL08qyoDBaKs4yQbFIQWYmPyR+vVXEWkkv1Ey/x0y
	AAaB4/mJ9GVSpf6f/pUzwhdCs8TKVPrNrpI3U86NMWewVVZ8C+YkWZcTmsK3vw0GKfj/
	fas0aKl6a11VBasR+3uUsslaOX7uu7tWNn+lofjRfJBJ3Dx3uceE1kelDQV8YpSuutgr
	yLbrQWHV/U2wxUt4jCpvXRY5MCtT8Xd2txqbMahGcMgRSV+Ay/mC7ED5wrDefC0GD++/
	uupA==
MIME-Version: 1.0
X-Received: by 10.60.161.167 with SMTP id xt7mr8486393oeb.28.1431698144645;
	Fri, 15 May 2015 06:55:44 -0700 (PDT)
Received: by 10.60.6.33 with HTTP; Fri, 15 May 2015 06:55:44 -0700 (PDT)
In-Reply-To: <CAFZh4h9=cJG8aVbwvh_NjR24UTnCj9A44zHPs3rqEn_rdCfN3A@mail.gmail.com>
References: <4f2d75bf33ac423ab064f754e0b67655@ASTRO-EX1.Bensberg.de>
	<5540DB34.6010102@windriver.com>
	<a01714e680f8470cb21bb0b52e66c91e@ASTRO-EX1.Bensberg.de>
	<55421DA2.9060909@windriver.com>
	<e134e69a27bd460a9da71929a7f78d9a@ASTRO-EX1.Bensberg.de>
	<554236CB.6000604@windriver.com>
	<CAFZh4h9oL7K-=Nxhy=GV0k31ZgnPQuhFLQ-r_fReSRk1ZRhk1g@mail.gmail.com>
	<5550FD98.1050507@windriver.com>
	<CAFZh4h-SqSVsG_HXrx3H=QfDs3DH5GoKmFCgwBgGq90+B4WB5A@mail.gmail.com>
	<55521DB8.2070606@windriver.com> <20150514220801.GD20022@denix.org>
	<CAFZh4h9=cJG8aVbwvh_NjR24UTnCj9A44zHPs3rqEn_rdCfN3A@mail.gmail.com>
Date: Fri, 15 May 2015 09:55:44 -0400
Message-ID: <CAFZh4h-r1_gabVP0HdDoOrcT_neED51JpMmm586KLuc_efWdFg@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	=?UTF-8?B?U2NoYXVtbMO2ZmZlbCw=?= <J.Schaumloeffel@astro-kom.de>,
	"meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [yocto] Migration from 1.7.1 to 1.8 - kernel-abiversion missing
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
X-List-Received-Date: Fri, 15 May 2015 13:55:52 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 14, 2015 at 6:16 PM, Brian Hutchinson <b.hutchman@gmail.com> wrote:
>
> On May 14, 2015 6:08 PM, "Denys Dmytriyenko" <denis@denix.org> wrote:
>>
>> On Tue, May 12, 2015 at 11:35:20AM -0400, Bruce Ashfield wrote:
>> > On 2015-05-12 10:20 AM, Brian Hutchinson wrote:
>> > >On Mon, May 11, 2015 at 3:06 PM, Bruce Ashfield
>> > ><bruce.ashfield@windriver.com> wrote:
>> > >>On 2015-05-11 02:10 PM, Brian Hutchinson wrote:
>> > >>>
>> > >>>On Thu, Apr 30, 2015 at 10:06 AM, Bruce Ashfield
>> > >>><bruce.ashfield@windriver.com> wrote:
>> > >>>>
>> > >>>>It is plausible. But in theory, linux-dummy should still provide
>> > >>>>what you need (but since it doesn't build anything, there is
>> > >>>>no abi .. and no modules can be built against it) .. so the
>> > >>>>error isn't graceful.
>> > >>>>
>> > >>>>Bruce
>> > >>>
>> > >>>
>> > >>>I can confirm this same problem is happening to me.  I just updated
>> > >>>one of my builds from 1.7 to 1.8 and am also getting my rootfs to
>> > >>> fail
>> > >>>due to no abi kernel version:
>> > >>
>> > >>
>> > >>We still have a race condition in the 1.8 branch for the population
>> > >>of the build-artifacts directory.
>> > >>
>> > >>If modules start building, they'll race against the population of the
>> > >>abiversion, and you may see that message.
>> > >>
>> > >>There's a proposed patch for master, but I don't think it is in
>> > >>fido yet.
>> > >>
>> > >>Bruce
>> > >
>> > >Hi Bruce,
>> > >
>> > >I did some searches and looks like there are a number of 'race'
>> > >condition fixes but it wasn't obvious which one I may need.  Is it
>> > >this one:
>> >
>> > > >http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=02d0a003d603266114512160b209876199241e98
>> > >
>> >
>> > That's the one that should make sure that the shared workdir
>> > (Which has the abiversion) is in place before building any modules.
>> >
>> > I can't say that it is exactly your issue, but it is the change
>> > I was thinking of.
>>
>> Brian,
>>
>> Were you able to try the above mentioned commit against am180x in meta-ti?
>> Did
>> it solve the missing abi kernel version? Thanks.
>>
>> --
>> Denys
>
> Hi Denys,
>
> No, I got caught up in something else ... I'll try it tomorrow and report
> back after I cherry pick that commit Bruce mentioned.
>
> Regards,
>
> Brian

Update.  Not sure if I did this right but this is what I did.  I added
master as a remote and cherry picked
02d0a003d603266114512160b209876199241e98.  Next I just went for it and
tried to bitbake my image again and got the same result as before.
Next I did a bitbake cleanall on virtual/kernel and tried to make my
image again and still got the same result.

I'm going to leave this build as is and setup a new one using 1.8
master and see if I get the same thing again.  I'll leave this broken
build alone for a while in case someone wants me to try something with
it to fix it.

Regards,

Brian

