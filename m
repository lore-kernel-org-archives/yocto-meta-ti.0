Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5E5ACE009E7; Fri,  6 Jun 2014 17:22:25 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [206.46.173.17 listed in list.dnswl.org]
X-Greylist: delayed 3601 seconds by postgrey-1.32 at yocto-www;
	Fri, 06 Jun 2014 17:22:20 PDT
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 05E46E0073D
	for <meta-ti@yoctoproject.org>; Fri,  6 Jun 2014 17:22:20 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N6R00ENMSWELBA0@vms173017.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 06 Jun 2014 18:22:01 -0500 (CDT)
Received: from [IPV6:2607:fb90:131e:727c:9eec:1b9:43e8:3cee]
	(unknown [172.56.3.205])	by gandalf.denix.org (Postfix)
	with ESMTPA id 3DB872018E; Fri, 06 Jun 2014 19:21:50 -0400 (EDT)
User-Agent: K-9 Mail for Android
In-reply-to: <8aa2461c-f215-408a-8fd2-833164d2da19@email.android.com>
References: <CAOd_LFzCrgUGLKtgPUSQgxtd7ASn8Ee4oBbDyCSZH8yobh78pw@mail.gmail.com>
	<7D46E86EC0A8354091174257B2FED1015D09841A@DLEE11.ent.ti.com>
	<CAOd_LFwesJcR4nan9Bp9E8dQVj6-GPOZFEU-6OCUjQcjdFd=Tw@mail.gmail.com>
	<20140606154235.GA18034@edge> <53924541.3060109@balister.org>
	<8aa2461c-f215-408a-8fd2-833164d2da19@email.android.com>
MIME-version: 1.0
From: Denys Dmytriyenko <denis@denix.org>
Date: Fri, 06 Jun 2014 19:21:47 -0400
To: Philip Balister <philip@balister.org>,Denys Dmytriyenko <denys@ti.com>,
	Cliff Brake <cliff.brake@gmail.com>
Message-id: <58922cb0-f000-4002-af32-7c0d1234c95c@email.android.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: what branch of meta-ti should be used with dora?
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
X-List-Received-Date: Sat, 07 Jun 2014 00:22:25 -0000
Content-transfer-encoding: 8bit
Content-type: text/plain; charset=UTF-8

On June 6, 2014 7:08:26 PM EDT, Denys Dmytriyenko <denis@denix.org> wrote:
>On June 6, 2014 6:48:33 PM EDT, Philip Balister <philip@balister.org>
>wrote:
>>On 06/06/2014 11:42 AM, Denys Dmytriyenko wrote:
>>> On Fri, Jun 06, 2014 at 11:32:32AM -0400, Cliff Brake wrote:
>>>> got it.  Looking further, I happened to be using
>>>> https://github.com/Angstrom-distribution/meta-ti, so that is why I
>>>> don't see the dora branch.  Thanks!
>>> 
>>> And that is NOT meta-ti!
>>> 
>>> That is actually a very wicked way to discredit the project... I've
>>heard 
>>> first-hand few other instances when people were confused by that
>>stale fork 
>>> into thinking meta-ti is dead. :(
>>> 
>>
>>Oh come on, it is labeled as a mirror. I updated the banner to point
>at
>>the YP git.
>>
>>https://github.com/Angstrom-distribution/meta-ti
>>
>>Philip
>
>Exactly - come on! Why do you need an old outdated "mirror"??

Moreover, if it's a true mirror, please update it to be current. If it's an outdated and stale fork, please remove it. Or at least rename it, as it's no longer true meta-ti. Why do you even need it in this form?

-- 
Denys

