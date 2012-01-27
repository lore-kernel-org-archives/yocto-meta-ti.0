Return-Path: <wmills@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 88FDDE00599
	for <meta-ti@yoctoproject.org>; Fri, 27 Jan 2012 09:30:23 -0800 (PST)
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q0RHULam022811;
	Fri, 27 Jan 2012 11:30:21 -0600
Received: from DLEE74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id q0RHULOZ023880;
	Fri, 27 Jan 2012 11:30:21 -0600 (CST)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 27 Jan 2012 11:30:21 -0600
Received: from gtwmills.gt.design.ti.com (gtwmills.gt.design.ti.com
	[158.218.100.52])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	q0RHULXl021947;	Fri, 27 Jan 2012 11:30:21 -0600
Message-ID: <4F22DF2C.1090907@ti.com>
Date: Fri, 27 Jan 2012 12:30:20 -0500
From: William Mills <wmills@ti.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Thunderbird/3.1.11
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <1327603585-5599-1-git-send-email-Chase.Maupin@ti.com>	<4F21D735.5000303@ti.com>
	<27324814-C581-4BD9-92DF-68FC5CB4CECF@dominion.thruhere.net>
In-Reply-To: <27324814-C581-4BD9-92DF-68FC5CB4CECF@dominion.thruhere.net>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 1/3] matrix-gui-browser: port from arago	overlay
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
X-List-Received-Date: Fri, 27 Jan 2012 17:30:23 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 01/27/2012 06:50 AM, Koen Kooi wrote:
>
> Op 26 jan. 2012, om 23:44 heeft William Mills het volgende geschreven:
>
>> On 01/26/2012 01:46 PM, Chase Maupin wrote:
>>> * This package adds a simple web browser GUI application with
>>>    no decorations used to display matrix on the local display.
>>> * Ported from arago overlay
>>>
>>
>> Sorry for hijacking your patch Chase but I have serious big picture questions about all this stuff going into meta-ti and especially all into one layer.
>>
>> meta-ti is suppose to be the TI specific stuff people need to support their platforms regardless of what layer stack they are using.  I understand we are not layer stack independent yet but that needs to be the goal.  Certainly adding a whole bunch of non-HW related stuff into the same layer is not going to move us any closer.
>>
>> When we talked about where matrix belonged before there was debate about meta-oe or meta-arago.  When did I miss the memo that put it into meta-ti??
>
> Since meta-arago is supposed to be as empty as possible and matrix doesn't play well with others it's a bad fit for both meta-arago and meta-oe. Maybe we should split the meta-ti repo into 2 layers: one for BSP things (including sgx, dsp, etc) and one for 'sdk' things (matrix).
> The idea is to keep reusable TI deliverables together without forcing people to use arago. Putting matrix in meta-arago would mean you can only use it with DISTRO=arago, which is a huge step backwards from the current situation.

matrix does not play well with others so we should put it in the layer 
that is suppose to work in as many layer stacks as possible??

Yes, this can be fixed by making a different layer (as I alluded to) in 
meta-ti but the same can be said for meta-arago or (harder sell) for 
meta-oe (a "staging" layer?).  I agree the Arago _distro_ _layer_ needs 
to be as thin as possible but that does not need to apply to the 
meta-arago.git.

There is nothing "TI" about matrix other than we wrote it and are the 
ones that use it most often.  The same logic could apply to meta-arago. 
  Matrix originated in Arago related activities and is more closly 
related to the Arago concept than the TI concept.

If lots of people pick up and want to use Matrix it would would need to 
move out of either place (meta-ti or meta-arago) to somewhere more 
neutral.  However it would also need to more sophisticated in how it 
"plays with others".

meta-ti should not be a dumping ground for all things that happened to 
have originated at TI.  meta-ti needs to be clean.  meta-arago can be a 
little messy if need be.

Regardless of who's opinion prevails it seems we agree that another 
layer is needed.  Agreed?

