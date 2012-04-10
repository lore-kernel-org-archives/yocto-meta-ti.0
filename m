Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0C778E0044D
	for <meta-ti@yoctoproject.org>; Tue, 10 Apr 2012 13:46:39 -0700 (PDT)
Received: (qmail 9119 invoked by uid 1003); 10 Apr 2012 20:46:39 -0000
Received: from unknown (HELO ?192.168.1.110?) (philip@opensdr.com@157.22.28.13)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	10 Apr 2012 20:46:39 -0000
Message-ID: <4F849C2D.5080707@balister.org>
Date: Tue, 10 Apr 2012 13:46:37 -0700
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.24) Gecko/20111108 Fedora/3.1.16-1.fc14 Thunderbird/3.1.16
MIME-Version: 1.0
To: Denys Dmytriyenko <denis@denix.org>
References: <1334063833-9235-1-git-send-email-eric@eukrea.com>	<6C2C4B59-3AD6-4C69-8534-D5E32BEACBA4@dominion.thruhere.net>
	<20120410201048.GA23477@denix.org>
In-Reply-To: <20120410201048.GA23477@denix.org>
X-Enigmail-Version: 1.1.2
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] u-boot-git: add COMPATIBLE_MACHINE
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
X-List-Received-Date: Tue, 10 Apr 2012 20:46:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 04/10/2012 01:10 PM, Denys Dmytriyenko wrote:
> On Tue, Apr 10, 2012 at 03:28:41PM +0200, Koen Kooi wrote:
>>
>> Op 10 apr. 2012, om 15:17 heeft Eric B?nard het volgende geschreven:
>>
>>> so that an other BSP layer can also provide a u-boot_git recipe
>>
>> ah right, we talked about this earlier and were going to namespace our uboot 
>> recipes instead. COMPATIBLE_MACHINE is just too dang hard to grasp for 
>> customers adding their machine.
> 
> We can just list all the SoC families in COMPATIBLE_MACHINES - that would 
> solve the issues with other non-TI-derived BSP layers. Won't help meta-ettus 
> or meta-gumstix or meta-openpandora, though...
> 

I changed the u-boot recipe name.

Philip

