Return-Path: <philip@balister.org>
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 21812E011AD
	for <meta-ti@yoctoproject.org>; Tue,  7 Aug 2012 08:41:39 -0700 (PDT)
Received: (qmail 13264 invoked by uid 1003); 7 Aug 2012 15:41:36 -0000
Received: from unknown (HELO ?192.168.1.186?) (philip@opensdr.com@96.10.208.67)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	7 Aug 2012 15:41:36 -0000
Message-ID: <5021372F.2080705@balister.org>
Date: Tue, 07 Aug 2012 11:41:35 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <5020D9A0.30000@communistcode.co.uk> <20120807153016.GA8716@edge>
	<015A9197-70E1-4195-BA85-71097586D635@dominion.thruhere.net>
	<20120807153806.GC8716@edge>
In-Reply-To: <20120807153806.GC8716@edge>
Cc: meta-ti@yoctoproject.org
Subject: Re: Turning off kernel config option
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
X-List-Received-Date: Tue, 07 Aug 2012 15:41:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/07/2012 11:38 AM, Denys Dmytriyenko wrote:
>
>> Or just increment PR as you're supposed to, it's an output change after all.
>> No need to check anything if you do it properly :)

And if you are like me, it would take about 10 PR increments just to get 
the change working properly. Then you would ask me what I changed in 
those PR's :)

Philip

>
> Well, but then you are staring to change the recipe, which might be overkill
> for a simple defconfig change you want to test. If you go that route, you may
> want to create your own custom layer with the modified defconfig overlayed on
> top of meta-ti and a simple .bbappend with PRINC. That way your changes will
> be detached from meta-ti and you won't need to merge the recipe changes every
> time meta-ti updates... Although, there's no way to bbappend the defconfig
> itself - that's where config fragments come to play.
>

