Return-Path: <Paul_Woegerer@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 834B4E00294
	for <meta-ti@yoctoproject.org>; Tue, 13 Nov 2012 05:13:16 -0800 (PST)
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1TYGIl-0000K0-Pg from Paul_Woegerer@mentor.com ;
	Tue, 13 Nov 2012 05:13:15 -0800
Received: from SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Tue, 13 Nov 2012 05:13:15 -0800
Received: from [137.202.56.138] (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server id 14.1.289.1; Tue, 13 Nov 2012 13:13:13 +0000
Message-ID: <50A247AF.10109@mentor.com>
Date: Tue, 13 Nov 2012 14:14:23 +0100
From: "Woegerer, Paul" <Paul_Woegerer@mentor.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121025 Thunderbird/16.0.2
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <5077D9E9.4070207@mentor.com> <20121113015716.GE8900@denix.org>
In-Reply-To: <20121113015716.GE8900@denix.org>
X-OriginalArrivalTime: 13 Nov 2012 13:13:15.0675 (UTC)
	FILETIME=[A429E6B0:01CDC1A0]
X-Mailman-Approved-At: Wed, 21 Nov 2012 15:32:33 -0800
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] linux-omap4-3.1.0: Add sched_process_exec tracing
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
X-List-Received-Date: Tue, 13 Nov 2012 13:13:16 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit

On 11/13/2012 02:57 AM, Denys Dmytriyenko wrote:
> On Fri, Oct 12, 2012 at 10:50:49AM +0200, Woegerer, Paul wrote:
>> Hi,
>>
>> the attached patch enables tracing of sched_process_exec events by
>> adding upstream kernel commit:
>> https://github.com/torvalds/linux/commit/4ff16c25e2cc48cbe6956e356c38a25ac063a64d
>> to the linux-omap4-3.1.0 kernel recipe (tested with pandaboard).
>>
>> We added this to our meta-ti mirror. It would be great if this could
>> also be upstream.
> 
> Paul,
> 
> Care to port it to the 3.4 version we now have for OMAP4?
> 

Hi Denys,

thanks for getting back to me. This patch is obsolete since 3.4 already
has sched_process_exec anyway.

Thanks again,
Paul

-- 
Paul Woegerer | SW Development Engineer
http://go.mentor.com/sourceryanalyzer

Mentor Embedded(tm) | Prinz Eugen Straße 72/2/4, Vienna, 1040 Austria
Nucleus® | Linux® | Android(tm) | Services | UI | Multi-OS

Android is a trademark of Google Inc. Use of this trademark is subject
to Google Permissions.
Linux is the registered trademark of Linus Torvalds in the U.S. and
other countries.

